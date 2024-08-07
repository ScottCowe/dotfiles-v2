{ inputs, ... }:

{
  name = "cowe";
  groups = [ "wheel" "networkmanager" ];
  uid = 1001;
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
    imports = [ ../../home ];

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
      };

      graphical = {
        gtk-qt.enable = true;
        firefox.enable = true;
        fonts.enable = true;
        kitty.enable = true;
        easyeffects.enable = true;
        discord.enable = true;
        prismlauncher.enable = true;
        thunderbird.enable = true;
      };
    };
  };
}
