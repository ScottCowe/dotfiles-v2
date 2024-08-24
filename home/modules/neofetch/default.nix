{ lib, config, pkgs, ... }:

with lib; {
  options.neofetch = { 
    enable = mkEnableOption "neofetch"; 
  };

  config = mkIf config.neofetch.enable {
    home.packages = with pkgs; [ neofetch ];

    home.file.".config/neofetch/config.conf".source = ./ozosfetch.conf;
  };
}
