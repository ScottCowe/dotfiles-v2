{ pkgs, lib, config, ... }:

with lib; let
  cfg = config.modules.rofi;
in {
  options.modules.rofi = { 
    enable = mkEnableOption "rofi"; 
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ rofi-wayland ];

    home.file.".config/rofi/config.rasi".source = ./config.rasi;
    home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
  };
}
