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
    ./modules/neovim

    ./modules/stylix

    inputs.stylix.homeManagerModules.stylix

    ./modules/firefox.nix
    ./modules/rofi
    ./modules/waybar.nix
    {
      nixpkgs.config.allowUnfree = true;

      nixpkgs.config.permittedInsecurePackages = [
        "dotnet-runtime-7.0.20"
      ];
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
    ./modules/libreoffice.nix
    ./modules/vintagestory.nix
    {
      programs.bottom.enable = true;
    }
    ./modules/vlc.nix
  ];
} 
