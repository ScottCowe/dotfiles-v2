{ pkgs, lib, config, inputs, ... }:

with lib; {
  options.common.wlogout = { 
    enable = mkEnableOption "wlogout"; 
  };

  config = mkIf config.common.wlogout.enable {
    programs.wlogout = {
      enable = true;
      
      layout = [
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "";
          keybind = "r";
        }
      ];
    };

    home.file.".config/wlogout/icons/".source = pkgs.stdenv.mkDerivation { 
      name = "wlogout-icons";
      
      src = pkgs.fetchFromGitHub {
        owner = "ArtsyMacaw";
        repo = "wlogout";
        rev = "1.2.2";
        sha256 = "sha256-/tYZy56ku68ziSOhy6Dex9RGy+blkU6CN2ze76y7718=";
      };

      installPhase = ''
        mkdir -p $out
        ls
        cp icons/*.png $out
      '';
    };
  };
}
