{ inputs, pkgs, ... }:

{
  imports = [ inputs.stylix.homeManagerModules.stylix ]; 

  stylix.enable = true;
  stylix.image = ./jupiter-wallpaper.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.liberation;
      name = "LiterationSerif Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.liberation;
      name = "LiterationSans Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  home.packages = with pkgs; [ adwaita-icon-theme ];
}
