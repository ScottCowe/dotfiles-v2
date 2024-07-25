{ lib, config, ... }:

with lib; {
  options.tui.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf config.tui.git.enable {
    programs.git = {
      enable = true;
      userName = "Scott Cowe";
      userEmail = "scott.t.cowe@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
