{ inputs, ... }:

{
  mkISOSystem = system: pkgs:
  pkgs.lib.nixosSystem {
    modules = [
      "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"

      {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        nixpkgs.hostPlatform = "${system}"; 

        programs.git.enable = true;
      }
    ]; 
  };
}
