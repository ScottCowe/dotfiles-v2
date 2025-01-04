{
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
}
