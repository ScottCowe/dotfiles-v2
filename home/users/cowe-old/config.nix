{ ... }:

{
  imports = [
    ../../modules
  ];

  config = {
    modules = {
      # System
      firefox.enable = true;
      bat.enable = true;
      bottom.enable = true;
      eza.enable = true;
      ssh.enable = true;
      git.enable = true;
      xdg.enable = true;
      gtk-qt.enable = true;
      fonts.enable = true;
      easyeffects.enable = true;
      discord.enable = true;
      thunderbird.enable = true;
      libreoffice.enable = true;
      zsh.enable = true;
      hyprland.enable = true;
      wlogout.enable = true;
      waybar.enable = true;
      mako.enable = true;
      rofi.enable = true;
      kitty.enable = true;
      lf.enable = true;
      neofetch.enable = true;

      # Development
      neovim.enable = true;

      ## Uni
      jetbrains.idea.enable = true;
      rstudio.enable = true;

      # Gaming
      packwiz.enable = true;
      prismlauncher.enable = true;
      lutris.enable = true;
      steam.enable = true;
    };
  };
}
