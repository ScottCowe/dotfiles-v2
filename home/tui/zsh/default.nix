{ lib, config, ... }:

with lib; {
  options.tui.zsh = {
    enable = mkEnableOption "zsh"; 
  };

  config = mkIf config.tui.zsh.enable {
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
