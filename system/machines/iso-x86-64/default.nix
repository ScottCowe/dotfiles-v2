{ inputs, ... }:

rec { 
  hostname = "iso"; 
  nixpkgs = inputs.nixpkgs;
  stateVersion = "24.05"; 
  system = "x86_64-linux"; 
  additionalModules = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];
  systemConfiguration = (import ./config.nix { inherit system; });
}
