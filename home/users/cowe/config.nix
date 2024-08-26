{ ... }:

{
  imports = [
    ../../modules
  ];

  config = {
    bat.enable = true;
    neovim.enable = true;
    bottom.enable = true;
    eza.enable = true;
    ssh.enable = true;
    git.enable = true;
    xdg-module.enable = true;
    packwiz.enable = true;
    gtk-qt.enable = true;
    fonts.enable = true;
    easyeffects.enable = true;
    discord.enable = true;
    thunderbird.enable = true;
    prismlauncher.enable = true;
    neofetch.enable = true;
    
    modules = {
      lutris.enable = true;
    };
  };
}
