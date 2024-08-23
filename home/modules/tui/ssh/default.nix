{ lib, config, ... }:

with lib; {
  options.tui.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf config.tui.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    services.ssh-agent.enable = true;
  };
}
