{ inputs, system, ... }:

{
  name = "cowe";
  groups = [ "wheel" "networkmanager" ];
  uid = 1001;
  shell = inputs.nixpkgs.legacyPackages."${system}".zsh;
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
}
