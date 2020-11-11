{ pkgs, lib, ... }:

let
    wallpaper = builtins.fetchurl {
      url = https://www.ubackground.com/_ph/86/320633713.jpg;
      sha256 = "e3336bbc7d9c389af3202322b40e5f67415df7da1537bb9bb923d230b1aee29c";
    };
in
{
  enable = true;
  package = pkgs.i3-gaps;
  
  config = rec {
    modifier = "Mod4";
    bars = [];
		
    window.border = 0;
		
    gaps = {
      inner = 12;
      outer = 0;
    };
    
    keybindings = lib.mkOptionDefault {
      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+q" = "kill";

      # Lock
      "${modifier}+x" = "exec ${pkgs.i3lock-fancy}/bin/i3lock-fancy -p -t \"System Locked Down\"";
      
      # Screenshot
      "Print" = "exec ${pkgs.shutter}/bin/shutter -s";
      
      # Brightness
      "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";
      "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5";

      # Audio
      "XF86AudioLowerVolume" = "exec \"amixer -q sset Master 1%-\"";
      "XF86AudioRaiseVolume" = "exec \"amixer -q sset Master 1%+\"";
      "XF86AudioMute" = "exec \"amixer -q sset Master toggle\"";
    };

    startup = [
      {
        command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
        always = true;
        notification = false;
      }

      {
        command = "${pkgs.bash}/bin/bash xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x309 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal";
        always = true;
      }
    ];

  };
}
