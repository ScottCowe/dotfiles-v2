{ inputs, ... }:

rec {
  system = "x86_64-linux";
  hostname = "desktop";
  stateVersion = "24.11";
  pkgs = inputs.nixpkgs;
  timezone = "Europe/London";
  locale = "en_US.UTF-8";
  # consoleFont = "";
  gpuType = "nvidia";
  users = [
    (import ../../users/cowe { inherit inputs system; })
  ];
  unfreePackages = [
    "nvidia-x11"
    "nvidia-settings"
    "wootility"
  ];
  extraConfig = { };
}
