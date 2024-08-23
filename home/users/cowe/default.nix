{ inputs, ... }:

{
  name = "cowe";
  groups = [ "wheel" "networkmanager" ];
  shell = "zsh";
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
  wm = "hyprland";
  terminal = "kitty";
  browser = "firefox"; 
  fileBrowser = "lf";
  unfreePackages = [
    "discord"
  ];
  extraConfig = {
    imports = [ ../../modules ];

    config = {
      tui = {
        bat.enable = true;
        neovim.enable = true;
        bottom.enable = true;
        eza.enable = true;
        lf.enable = true;
        ssh.enable = true;
        git.enable = true;
        xdg.enable = true;
        aerc.enable = true;
        packwiz.enable = true;
      };

      graphical = {
        gtk-qt.enable = true;
        firefox.enable = true;
        fonts.enable = true;
        mako.enable = true;
        rofi.enable = true;
        kitty.enable = true;
        easyeffects.enable = true;
        discord.enable = true;
        thunderbird.enable = true;
        nextcloud.enable = false;
        prismlauncher.enable = true;
      };
    };
  };
}
