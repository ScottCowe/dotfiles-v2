{ inputs, stateVersion, ... }:

let
  libx = (import ../../../lib { inherit inputs; });
in
libx.mkHome {
  username = "cowe";
  stateVersion = stateVersion;
  modules = [
    {
      nixpkgs.config.allowUnfree = true;
    }

    ./modules/lf
    ./modules/neovim
    ./modules/stylix
    ./modules/rofi

    ./modules/bat.nix
    ./modules/eza.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/wlogout.nix
    ./modules/mako.nix
    ./modules/firefox.nix
    ./modules/waybar.nix
    ./modules/discord.nix
    ./modules/ssh.nix
    ./modules/git.nix
    ./modules/prismlauncher.nix
    ./modules/steam.nix
    ./modules/xdg.nix
    ./modules/libreoffice.nix
    ./modules/vintagestory.nix
    ./modules/vlc.nix
    ./modules/thunderbird.nix
    ./modules/spicetify.nix
    ./modules/bluetooth.nix
    ./modules/epy.nix
    ./modules/qbittorrent.nix
    ./modules/fish.nix
    ./modules/zen.nix
  ];
}
