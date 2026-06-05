{ config, ... }:

{
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

    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/api" = [ "firefox.desktop" ];
        "x-scheme-handler/unity" = [ "firefox.desktop" ];
        "text/html" = [ "firefox.desktop" ];
        "application/pdf" = [ "firefox.desktop" ];
      };
    };
  };
}
