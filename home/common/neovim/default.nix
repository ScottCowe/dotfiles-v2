{ lib, config, inputs, ... }:

with lib; {
  options.common.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf config.common.neovim.enable {
    home.packages = [ 
      inputs.nixvim-flake.packages."x86_64-linux".default 
    ];

    home.sessionVariables.EDITOR = "nvim";
  };
}
