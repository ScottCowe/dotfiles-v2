{ system }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "${system}"; 
  programs.git.enable = true;
}
