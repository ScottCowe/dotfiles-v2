{ lib, config, ... }:

with lib; {
  options.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf config.ssh.enable {
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
