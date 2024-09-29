{ lib, config, ... }:

with lib; let
  cfg = config.modules.xdg; 
in {
  options.modules.xdg = {
    enable = mkEnableOption "xdg";
  };

  config = mkIf cfg.enable {
    xdg = {
      userDirs = {
        enable = true;
        documents = "${config.home.homeDirectory}/documents";
        download = "${config.home.homeDirectory}/downloads";
        videos = "${config.home.homeDirectory}/media/videos";
        music = "${config.home.homeDirectory}/media/music";
        pictures = "${config.home.homeDirectory}/media/pictures";
        desktop = null;
        publicShare = null;
        templates = null;
      };
    };
  };
}
