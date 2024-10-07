{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.git.enable = true;

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
}
