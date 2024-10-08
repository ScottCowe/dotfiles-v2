{ lib, config, inputs, pkgs, ... }:

with lib; let
  cfg = config.modules.neovim;
in {
  options.modules.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    home.packages = [ 
      (inputs.nixvim-flake.packages."${pkgs.system}".default.extend {
        colorschemes.base16 = {
          enable = true;
          colorscheme = with config.colorScheme.palette; {
            base00 = "#${base00}";
            base01 = "#${base01}";
            base02 = "#${base02}";
            base03 = "#${base03}";
            base04 = "#${base04}";
            base05 = "#${base05}";
            base06 = "#${base06}";
            base07 = "#${base07}";
            base08 = "#${base08}";
            base09 = "#${base09}";
            base0A = "#${base0A}";
            base0B = "#${base0B}";
            base0C = "#${base0C}";
            base0D = "#${base0D}";
            base0E = "#${base0E}";
            base0F = "#${base0F}";
          };
        };
      })
    ];

    home.sessionVariables.EDITOR = "nvim";
  };
}
