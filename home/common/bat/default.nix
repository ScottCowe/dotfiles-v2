{ lib, config, ... }:

with lib; {
  options.common.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf config.common.bat.enable {
    programs.bat = {
      enable = true;
    };
  };
}
