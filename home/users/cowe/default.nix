{ inputs, ... }:

{
  name = "cowe";
  groups = [ "wheel" "networkmanager" ];
  shell = "zsh";
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
  wm = "hyprland";
  terminal = "kitty";
  browser = "firefox"; 
  fileBrowser = "lf";
  unfreePackages = [
    "discord"
    "steam"
    "steam-original"
    "steam-run"
  ];
}
