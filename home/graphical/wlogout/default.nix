{ lib, config, ... }:

with lib; {
  options.graphical.wlogout = { 
    enable = mkEnableOption "wlogout"; 
  };

  config = mkIf config.graphical.wlogout.enable {
    programs.wlogout = {
      enable = true;
      
      layout = [
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "󰍃";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "";
          keybind = "r";
        }
      ];
    };
  };
}
