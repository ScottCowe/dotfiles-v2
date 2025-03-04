{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.lsp.servers.texlab.enable = true;

    plugins.vimtex = {
      enable = true;
      texlivePackage = (
        pkgs.texliveFull.withPackages (
          ps: with ps; [
            multirow
          ]
        )
      );
      settings = {
        view_method = "zathura";
      };
    };

    autoGroups."CustomTex".clear = false;

    autoCmd = [
      {
        event = "User";
        group = "CustomTex";
        pattern = "VimtexEventQuit";
        command = "VimtexClean";
      }
    ];

    # TODO: Close viewer after closing buffer
  };
}
