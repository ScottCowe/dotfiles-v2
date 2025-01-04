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

    ./modules/firefox.nix
    ./modules/rofi
    ./modules/waybar.nix
    {
      programs.ssh = {
        enable = true;
        addKeysToAgent = "yes";

        extraConfig = ''
          Host github.com
            Hostname ssh.github.com
            Port 443
        '';
      };

      services.ssh-agent.enable = true;

      programs.git = {
        enable = true;
        userName = "Scott Cowe";
        userEmail = "scott.t.cowe@gmail.com";

        extraConfig = {
          init.defaultBranch = "main";
        };
      };
    }
  ];
} 
