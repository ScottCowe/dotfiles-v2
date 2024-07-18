{ lib, config, inputs, pkgs, ... }:

with lib; {
  options.common.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf config.common.neovim.enable {
    home.packages = [ 
      inputs.nixvim-flake.packages."${pkgs.system}".default 
    ];

    home.sessionVariables.EDITOR = "nvim";
  };
}
