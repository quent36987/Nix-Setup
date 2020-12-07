{ pkgs, ... }:

{
  enable = true;

  settings = {
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
      normal.family = "Consolas";
      size = 10.0;
    };

    cursor.style = "Beam";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch; echo" ];
    };

    colors = {
      primary = {
        background = "0x000000";
        foreground = "0xEBEBEB";
      };
      cursor = {
        text   = "0xFF261E";
        cursor = "0xFF261E";
      };
      normal = {
        black   = "0x0c0c0c";
        red     = "0xc50f1f";
        green   = "0x13a10e";
        yellow  = "0xc19c00";
        blue    = "0x0037da";
        magenta = "0x881798";
        cyan    = "0x9e96dd";
        white   = "0xcccccc";
      };
      bright = {
        black   = "0x767676";
        red     = "0xe74856";
        green   = "0x16c60c";
        yellow  = "0xf9f1a5";
        blue    = "0x3b78ff";
        magenta = "0xb4009e";
        cyan    = "0x61d6d6";
        white   = "0xf2f2f2";
      };
    };
  };
}
