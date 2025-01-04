{ inputs, pkgs, ... }:

{
  home.packages = [ 
    (inputs.nixvim-flake.packages."${pkgs.system}".default.extend {
      colorschemes.kanagawa.enable = true;
    })
  ];

  home.sessionVariables.EDITOR = "nvim";
}
