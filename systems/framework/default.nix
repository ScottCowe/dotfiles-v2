{ inputs, ... }:

rec {
  system = "x86_64-linux";
  hostname = "framework";
  stateVersion = "24.05";
  pkgs = inputs.nixpkgs;
  timezone = "Europe/London";
  locale = "en_US.UTF-8";
  # consoleFont = "";
  gpuType = "amd";
  users = [
    (import ../../users/cowe { inherit inputs system; })
  ];
  unfreePackages = [
    "wootility"
  ];
  extraConfig = { 
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
  };
  additionalModules = [ inputs.nixos-hardware.nixosModules.framework-13-7040-amd ];
}
