{ pkgs, config, ... }:

{
  imports = [ ../../nixos ];
  
  config = {
    pipewire.enable = true;
    kanata.enable = true;
    nvidia = {
      enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "535.154.05";
        sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
        sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
        openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
        settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
        persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
      };
    };
    wooting.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.zsh.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [ vim git ];
  };
}
