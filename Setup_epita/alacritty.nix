{ pkgs, ... }:

{
  enable = true;

  settings = {
    env.TERM = "xterm-256color";
    live_config_reload = true;

    window = {
      title = "Terminal";

      position = {
        x = 900;
        y = 350;
      };
      dimensions = {
        lines = 40;
        columns = 125;
      };
    };

    font = {
      normal.family = "Fira Code";
      normal.style = "Regular";
      size = 10.0;
    };

    cursor.style = "Beam";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch; echo" ];
    };

    colors = {
      primary = {
        background = "#2D2A2E";
        foreground = "#FCFCFA";
      };
      cursor = {
        text   = "0xFF261E";
        cursor = "0xFF261E";
      };
      normal = {
        black   = "#01060E";
        red     = "#EA6C73";
        green   = "#91B362";
        yellow  = "#F9AF4F";
        blue    = "#53BDFA";
        magenta = "#FAE994";
        cyan    = "#90E1C6";
        white   = "#C7C7C7";
      };
      bright = {
        black   = "#686868";
        red     = "#F07178";
        green   = "#C2D94C";
        yellow  = "#FFB454";
        blue    = "#59C2FF";
        magenta = "#FFEE99";
        cyan    = "#95E6CB";
        white   = "#FFFFFF";
      };
    };
  };
}
