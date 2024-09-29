{ lib, config, ... }:

with lib; let
  cfg = config.modules.wlogout; 
in {
  options.modules.wlogout = { 
    enable = mkEnableOption "wlogout"; 
  };

  config = mkIf cfg.enable {
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
