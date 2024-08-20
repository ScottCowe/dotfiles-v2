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
  };
  additionalModules = [ inputs.nixos-hardware.nixosModules.framework-13-7040-amd ];
}
