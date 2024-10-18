{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      name = "FiraCode Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
