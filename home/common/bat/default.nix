{ lib, config, pkgs, ... }:

with lib; {
  options.common.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf config.common.bat.enable {
    programs.bat = {
      enable = true;

      config = {
        theme = "base16";
      };
    };
  };
}
