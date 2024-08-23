{ lib, config, ... }:

with lib; {
  options.tui.aerc = {
    enable = mkEnableOption "aerc";
  };

  config = mkIf config.tui.aerc.enable {
    programs.aerc = {
      enable = true;
    };
  };
}
