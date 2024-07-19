{ pkgs, lib, config, ... }:

with lib; {
  options.common.rofi = { 
    enable = mkEnableOption "rofi"; 
  };

  config = mkIf config.common.rofi.enable {
    home.packages = with pkgs; [ rofi-wayland ];

    home.file.".config/rofi/config.rasi".source = ./config.rasi;
    home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
  };
}