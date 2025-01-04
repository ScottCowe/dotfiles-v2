{ inputs, pkgs, ... }:

{
  home.packages = [ 
    (inputs.nixvim-flake.packages."${pkgs.system}".default.extend {
      # colorschemes.base16 = {
      #   enable = true;
      #   colorscheme = config.stylix.base16Scheme; # No worky
      # };

      colorschemes.kanagawa.enable = true;
    })
  ];

  home.sessionVariables.EDITOR = "nvim";
}
