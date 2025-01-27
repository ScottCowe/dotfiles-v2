{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    globals.mapLeader = " ";

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
