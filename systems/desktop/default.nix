{ pkgs, ... }:

{
  imports = [ ../../nixos ];
  
  config = {
    pipewire.enable = true;
    kanata.enable = false;
    timezone = { 
      enable = true; 
      automatic = false;
      zone = "Europe/London";
    };
    nvidia = {
      enable = true;
    };

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
