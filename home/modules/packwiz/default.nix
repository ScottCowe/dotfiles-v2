{ lib, config, pkgs, ... }:

with lib; let
  cfg = config.modules.packwiz;
in {
  options.modules.packwiz = {
    enable = mkEnableOption "packwiz";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ packwiz ];
  };
}
