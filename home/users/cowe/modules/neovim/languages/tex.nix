{
  programs.nixvim = {
    plugins.lsp.servers.texlab = {
      enable = true;
      settings = {
        build.args = ''["-pdf", "-C", "-interaction=nonstopmode", "-synctex=1", "%f"]'';
      };
    };

    plugins.vimtex = {
      enable = true;
      settings.view_method = "zathura";

      # TODO: Cleanup files after closing buffer
      # TODO: Close viewer after closing buffer
    };
  };
}
