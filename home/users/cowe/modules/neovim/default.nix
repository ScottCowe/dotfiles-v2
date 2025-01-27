{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./cmp.nix
    ./options.nix
  ];

  stylix.targets.nixvim.enable = false;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.kanagawa.enable = true;    

    plugins = {
      lualine.enable = true;
  
      luasnip.enable = true;

      nvim-autopairs.enable = true;

      indent-blankline.enable = true;

      gitsigns.enable = true;

      comment.enable = true;

      presence-nvim.enable = true;

      treesitter.enable = true;
    };
  };
}
