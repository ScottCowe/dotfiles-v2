{ lib, config, pkgs, ... }:

with lib; {
  options.packwiz = {
    enable = mkEnableOption "packwiz";
  };

  config = mkIf config.packwiz.enable {
    home.packages = with pkgs; [ packwiz ];
  };
}
