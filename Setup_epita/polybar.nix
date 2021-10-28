{ pkgs, ... }:

# @author Vinetos

let
  background = "#000";
  background-alt = "#99333333";
  foreground = "#dadfe1";
  foreground-alt = "#555";
  primary = "#5c72f4";
  secondary = "#6ef9f9";
  alert = "#751715";

  # Config HERE
  network_interface = "wlo1";
  # Find theses names with $ls -1 /sys/class/power_supply/
  battery_name = "BAT1";
  battery_adapter = "ADP1";
in
  {
    enable = true;
  
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };
    
    script = "PATH=$PATH:${pkgs.i3}/bin polybar top &";
  
    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      "bar/top" = {
        width = "100%";
        height = 36;
        radius = 0;
        fixed-center = true;

        background = background;
        foreground = foreground;

        line-size = 3;
        line-color = "#f00";

        border-size = 0;
        border-color = "#000";

        padding-left = 0;
        padding-right = 4;

        module-margin-left = 3;
        module-margin-right = 3;

        font-0 = "Iosevkka Term:size=10;2";
        font-1 = "Font Awesome 5 Free:pixelsize=10;1";
        font-2 = "Font Awesome 5 Free Solid:pixelsize=10;1";
        font-3 = "Font Awesome 5 Brands:pixelsize=10;1";

        modules-left = "i3 xwindow";
        modules-center = "date";
        modules-right = "xkeyboard network memory cpu battery powermenu";

        tray-position = "right";
        tray-padding = 2;

        enable-ipc = "true";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:64:...%";
      };
      
      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = true;
        strip-wsnumbers = true;
	
        label-mode = "%mode%";
        label-mode-padding = 4;
        label-mode-foreground = foreground;
        label-mode-background = primary;

        label-focused = "%name%";
        label-focused-background = background-alt;
        label-focused-underline = primary;
        label-focused-padding = 4;
	
        label-unfocused = "%name%";
        label-unfocused-padding = 4;	
      	label-visible = "V %index%";
        label-visible-background = "\${self.label-focused-background}";
        label-visible-underline = "\${self.label-focused-background}";
        label-visible-padding = "\${self.label-focused-padding}";
	
      	label-urgent = "";
        label-urgent-background = alert;
        label-urgent-padding = 4;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = " ";
        format-prefix-foreground = foreground-alt;
        format-underline = "#00000000";
        label = "%percentage%%";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = " ";
        format-prefix-foreground = foreground-alt;
        format-underline = "#00000000";
        label = "%percentage_used%%";
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        label-layout = "%layout%";
      };

      "module/network" = {
        type = "internal/network";
        interface = network_interface;
        interval = 3;

        format-connected = "<ramp-signal> <label-connected>";
        format-connected-underline = "#00000000";
        label-connected = " %essid%";

        format-disconnected = "<label-disconnected>";
        format-disconnected-underline = alert;
        label-disconnected = "xx.xx.xx.xx";
        label-disconnected-foreground = foreground-alt;

        ramp-signal-0 = "";
        ramp-signal-1 = "";
        ramp-signal-2 = "";
        ramp-signal-3 = "";
        ramp-signal-4 = "";
        ramp-signal-foreground = foreground-alt;
      };

      "module/date" = {
        type = "internal/date";
        interval = 5;

        date = "";
        date-alt = " %Y-%m-%d";

        time = "%I:%M %p";
        time-alt = "%H:%M:%S";

        format-prefix = "";
        format-prefix-foreground = foreground-alt;
        format-underline = "#00000000";

        label = "%date% %time%";
      };

      "module/powermenu" = {
        type = "custom/menu";

        format-spacing = 1;

        label-open = "";
        label-open-foreground = foreground;
        label-close = "cancel";
        label-close-foreground = primary;
        label-separator = "|";
        label-separator-foreground = foreground-alt;

        menu-0-0 = "reboot";
        menu-0-0-exec = "menu-open-1";
        menu-0-1 = "power off";
        menu-0-1-exec = "menu-open-2";

        menu-1-0 = "cancel";
        menu-1-0-exec = "menu-open-0";
        menu-1-1 = "reboot";
        menu-1-1-exec = "reboot";

        menu-2-0 = "power off";
        menu-2-0-exec = "poweroff";
        menu-2-1 = "cancel";
        menu-2-1-exec = "menu-open-0";
      };

      
      "module/battery" = {
        type = "internal/battery";

        full-at = 100;

        battery = battery_name;
        adapter = battery_adapter;
        poll-interval = 5;

        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<ramp-capacity> <label-discharging>";

        label-charging =  "%percentage%%";
        label-discharging =  "%percentage%%";
        label-full = "Fully charged";

        # Only applies if <ramp-capacity> is used
        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        # Only applies if <bar-capacity> is used
        bar-capacity-width = 10;

        # Only applies if <animation-charging> is used
        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        # Framerate in milliseconds
        animation-charging-framerate = 750;
      };
    
      "settings" = {
        screenchange-reload = true;
      };   
      
    };
  }
