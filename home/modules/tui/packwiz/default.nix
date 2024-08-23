{ lib, config, pkgs, ... }:

with lib; {
  options.tui.packwiz = {
    enable = mkEnableOption "packwiz";
  };

  config = mkIf config.tui.packwiz.enable {
    home.packages = with pkgs; [ packwiz ];
  };
}
