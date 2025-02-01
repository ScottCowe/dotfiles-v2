{ pkgs, ... }:

{
  home.packages = with pkgs; [ ripgrep ];

  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<space>ff" = "git_files";
      "<space>fd" = "find_files";
      "<space>fg" = "live_grep";
    };
  };
}
