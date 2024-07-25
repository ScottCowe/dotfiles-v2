{ ... }:

{
  imports = [ ../../home ];

  config = {
    tui = {
      bat.enable = true;
      neovim.enable = true;
      bottom.enable = true;
      eza.enable = true;
      lf.enable = true;
      zsh.enable = true;
      ssh.enable = true;
      git.enable = true;
      xdg.enable = true;
    };

    graphical = {
      gtk-qt.enable = true;
      firefox.enable = true;
      wlogout.enable = true;
      waybar.enable = true;
      fonts.enable = true;
      mako.enable = true;
      rofi.enable = true;
      kitty.enable = true;
      hyprland.enable = true;
      easyeffects.enable = true;
    };
  };
}
