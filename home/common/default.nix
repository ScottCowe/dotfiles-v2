
{ ... }:

{
  imports = [
    ./git
    ./ssh
    ./zsh
    ./hyprland
    ./kitty
    ./rofi
    ./mako
    ./fonts
    ./waybar
    ./wlogout
    ./firefox
    ./lf
    ./eza
    ./bat
    ./bottom
  ];

  config = {
    common = {
      hyprland.enable = true;
      kitty.enable = true;
      rofi.enable = true;
      mako.enable = true;
      fonts.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
      firefox.enable = true;
      lf.enable = true;
      eza.enable = true;
      bat.enable = true;
      bottom.enable = true;
    };
  };
}
