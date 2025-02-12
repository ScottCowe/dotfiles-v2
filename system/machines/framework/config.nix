{ pkgs, lib, ... }:

{
  services.tailscale.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; 

  services.blueman.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.zsh.enable = true;
  programs.dconf.enable = true;
  
  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [ 
    vim git 
    # wootility
    cmatrix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;
    };
  };

  networking = {
    hostName = "framework";
    networkmanager.enable = true;
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "London/Europe";

  console = {
    earlySetup = true;
    keyMap = "us";
  };

  # services.udev.packages = [
  #   (pkgs.writeTextFile {
  #     name = "wooting_udev";
  #     destination = "/etc/udev/rules.d/70-wooting.rules";
  #     text = ''
  #       # Wooting One Legacy
  #       SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
  #       SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
  #       # Wooting One update mode 
  #       SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"
  #
  #       # Wooting Two Legacy
  #       SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
  #       SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
  #       # Wooting Two update mode  
  #       SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"
  #
  #       # Generic Wootings
  #       SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
  #       SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
  #     '';
  #   })
  # ];

  programs.hyprland.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
    };
  };

  services.fwupd.enable = true;

  services.power-profiles-daemon.enable = false;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "performance";
       turbo = "auto";
    };
  };
}
