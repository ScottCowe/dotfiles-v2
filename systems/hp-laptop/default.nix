{ pkgs, ... }:

{
  imports = [ ../../nixos ];
  
  config = {
    pipewire.enable = true;
    timezone.enable = true;
    kanata.enable = true;

    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.zsh.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [ vim git ];
  };
}
