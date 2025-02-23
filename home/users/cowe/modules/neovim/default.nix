{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./cmp.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
    # ./languages/ask.nix # for another time perhaps
    ./languages/tex.nix
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

      web-devicons.enable = true;

      lsp-lines.enable = true;

      lsp-format.enable = true;
    };
  };
}
