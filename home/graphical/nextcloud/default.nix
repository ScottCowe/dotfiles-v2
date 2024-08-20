{ lib, config, pkgs, ... }:

with lib; {
  options.graphical.nextcloud = { 
    enable = mkEnableOption "nextcloud"; 
  };

  config = mkIf config.graphical.nextcloud.enable {
    home.packages = with pkgs; [ nextcloud-client ];
  };
}
