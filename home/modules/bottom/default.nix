{ lib, config, ... }:

with lib; {
  options.bottom = {
    enable = mkEnableOption "bottom";
  };

  config = mkIf config.bottom.enable {
    programs.bottom = {
      enable = true;
    };
  };
}
