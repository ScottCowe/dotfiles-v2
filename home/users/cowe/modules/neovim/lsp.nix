{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      lua_ls.enable = true;
      pylsp.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;

      clangd.enable = true;
     
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      kotlin_language_server.enable = true;
      
      html.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      phpactor.enable = true;

      texlab.enable = true;
    };
  };
}
