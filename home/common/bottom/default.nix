{ lib, config, ... }:

with lib; {
  options.common.bottom = {
    enable = mkEnableOption "bottom";
  };

  config = mkIf config.common.bottom.enable {
    programs.bottom = {
      enable = true;
    };
  };
}
