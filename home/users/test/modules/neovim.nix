{ inputs, pkgs, config, ... }:

{
  home.packages = [ 
    (inputs.nixvim-flake.packages."${pkgs.system}".default.extend {
      colorschemes.base16 = {
        enable = true;
        colorscheme = config.stylix.base16Scheme;
      };
    })
  ];

  home.sessionVariables.EDITOR = "nvim";
}
