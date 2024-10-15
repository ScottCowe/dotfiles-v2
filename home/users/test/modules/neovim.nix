{ inputs, pkgs, ... }:

{
  home.packages = [ 
    (inputs.nixvim-flake.packages."${pkgs.system}".default.extend { })
  ];

  home.sessionVariables.EDITOR = "nvim";
}
