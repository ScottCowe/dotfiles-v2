{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          shiftwidth = 2;
          tabstop = 2;
        };
      };
    };
  };
}
