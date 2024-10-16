{ inputs, stateVersion, ... }:

let 
  libx = (import ../../../lib { inherit inputs; });
in libx.mkHome {
  username = "test";
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
    ./modules/neovim.nix

    ./modules/stylix

    inputs.stylix.homeManagerModules.stylix
  ];
} 
