{ lib, config, ... }:

with lib; {
  options.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    services.ssh-agent.enable = true;
  };
}
