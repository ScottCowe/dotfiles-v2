{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";

  # stylix.targets.hyprland.enable = false; # fixed some version shittery

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
      # package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      package = pkgs.nerd-fonts.fira-mono;
      name = "FiraCode Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
