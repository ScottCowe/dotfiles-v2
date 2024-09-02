{ lib, config, pkgs, ... }:

with lib; let
  cfg = config.modules.libreoffice;
in {
  options.modules.libreoffice = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ libreoffice ];
  };
}
