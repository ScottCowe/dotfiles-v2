{ inputs, stateVersion, ... }:

let 
  libx = (import ../../../lib { inherit inputs; });
in libx.mkHome {
  username = "cowe";
  stateVersion = stateVersion;
  modules = [ 
    ./modules/fish.nix
    ./modules/eza.nix 
    ./modules/hyprland.nix 
    ./modules/kitty.nix 
    ./modules/wlogout.nix
    {
      programs.bat.enable = true;
    }
    ./modules/lf
    {
      services.mako = {
        enable = true;
        defaultTimeout = 5000;
      };
    }
    # ./modules/neovim.nix
    ./modules/neovim

    ./modules/stylix

    inputs.stylix.homeManagerModules.stylix

    ./modules/firefox.nix
    ./modules/rofi
    ./modules/waybar.nix
    {
      nixpkgs.config.allowUnfree = true;
    }
    ./modules/discord.nix
    {
      programs.thunderbird.enable = true;
      programs.thunderbird.profiles."cowe".isDefault = true;
    }
    ./modules/ssh.nix
    ./modules/git.nix
    ./modules/nb.nix
    ./modules/prismlauncher.nix 
    ./modules/steam.nix
    ./modules/xdg.nix
  ];
} 
