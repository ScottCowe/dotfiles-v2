{ pkgs, config, ... }:

{
  imports = [ ../../nixos ];
  
  config = {
    pipewire.enable = true;
    kanata.enable = true;
    wooting.enable = true;
    bluetooth.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.zsh.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [ vim git brightnessctl ];
  };
}
