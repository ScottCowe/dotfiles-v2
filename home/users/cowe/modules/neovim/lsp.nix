{
  lib,
  pkgs,
  ...
}:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls = {
        enable = true;
        settings.nix.flake.autoEvalInputs = true;
        settings.nix.maxMemoryMB = 4096;
        settings.formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
      };

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

    keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<space>r" = "rename";
        "<space>a" = "code_action";
      };

      extra = [
        {
          action = "<cmd>lua require'jdtls'.organize_imports()<CR>";
          key = "<space>o";
        }
        {
          action = "<cmd>lua require('lsp_lines').toggle()<CR>";
          key = "<space>ll";
        }
      ];
    };
  };

  programs.nixvim.plugins.nvim-jdtls = {
    enable = true;
    cmd = [
      (lib.getExe pkgs.jdt-language-server)
    ];
    data = "~/.cache/jdtls/workspace";
    settings = {
      java = {
        signatureHelp = true;
        completion = true;
      };
    };
  };
}
