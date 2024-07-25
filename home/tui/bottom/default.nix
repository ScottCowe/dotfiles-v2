{ lib, config, ... }:

with lib; {
  options.tui.bottom = {
    enable = mkEnableOption "bottom";
  };

  config = mkIf config.tui.bottom.enable {
    programs.bottom = {
      enable = true;
    };
  };
}
