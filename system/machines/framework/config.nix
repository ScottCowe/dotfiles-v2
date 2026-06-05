{ pkgs, lib, ... }:

{
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  services.resolved.enable = true;

  networking = {
    hostName = "framework";
    networkmanager.enable = true;
    firewall.checkReversePath = "loose";
    nftables = {
      enable = true;
      ruleset = ''
        define EXCLUDED_IPS = {
          100.64.0.0/10,
        }

        table inet excludeTraffic {
          chain excludeOutgoing {
            type route hook output priority 0; policy accept;
            ip daddr $EXCLUDED_IPS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }
        }
      '';
    };
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "cowe" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  nix.extraOptions = ''
    extra-substituters = https://devenv.cachix.org
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
  '';

  services.borgbackup.jobs = {
    backupToLocalServer = {
      paths = [
        "/home/cowe/documents"
        "/home/cowe/media"
      ];
      exclude = [
        "/home/media/movies/*"
        "/home/media/tv-shows/*"
        "/home/media/music/*"
      ];
      repo = "ssh://borg@100.118.34.125:22/var/lib/borg/framework";
      environment.BORG_RSH = "ssh -i /home/cowe/.ssh/framework_borg";
      encryption.mode = "none";
      compression = "auto,lzma";
      startAt = "daily";
    };
  };

  services.gnome.at-spi2-core.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
  services.flatpak.enable = true;
  programs.noisetorch.enable = true;

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

  environment.defaultPackages = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [
    vim
    git
    # wootility
    cmatrix
    wireguard-tools
    protonvpn-gui
    orca
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.11";

  i18n.defaultLocale = "en_US.UTF-8";
  xdg.portal = {

    enable = true;

    xdgOpenUsePortal = true;

  };
  time.timeZone = "Etc/GMT-1";

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
