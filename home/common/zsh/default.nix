{ lib, config, ... }:

with lib; {
  options.common.zsh = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable home manager config for zsh 
      '';
    };
  };

  config = mkIf config.common.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {};

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      initExtra = ''
        unsetopt BEEP
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [ ];
        theme = "robbyrussell";
      };
    };
  };
}
