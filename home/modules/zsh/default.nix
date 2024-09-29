{ lib, config, ... }:

with lib; let
  cfg = config.modules.zsh;
in {
  options.modules.zsh = {
    enable = mkEnableOption "zsh"; 
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

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
