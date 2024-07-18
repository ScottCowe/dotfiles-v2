{ lib, config, ... }:

with lib; {
  options.common.git = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable git 
      '';
    };
  };

  config = mkIf config.common.git.enable {
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
