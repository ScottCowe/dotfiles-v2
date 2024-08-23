{ lib, config, ... }:

with lib; {
  options.tui.xdg = {
    enable = mkEnableOption "xdg";
  };

  config = mkIf config.tui.xdg.enable {
    xdg = {
      userDirs = {
        enable = true;
        documents = "${config.home.homeDirectory}/documents";
        download = "${config.home.homeDirectory}/downloads";
        videos = "${config.home.homeDirectory}/media/video";
        music = "${config.home.homeDirectory}/media/music";
        pictures = "${config.home.homeDirectory}/media/pictures";
        desktop = null;
        publicShare = null;
        templates = null;
      };
    };
  };
}
