{ inputs, ... }:

rec { 
  hostname = "iso"; 
  nixpkgs = inputs.nixpkgs;
  stateVersion = "24.11"; 
  system = "x86_64-linux"; 
  modules = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
    ./config.nix
    {
      nixpkgs.hostPlatform = "${system}"; 
    }
  ];
}
