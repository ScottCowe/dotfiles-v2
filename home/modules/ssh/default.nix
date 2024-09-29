{ lib, config, ... }:

with lib; let
  cfg = config.modules.ssh;
in {
  options.modules.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";

      extraConfig = ''
        Host github.com
          Hostname ssh.github.com
          Port 443
      '';
    };

    services.ssh-agent.enable = true;
  };
}
