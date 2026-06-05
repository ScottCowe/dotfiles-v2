{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea
    jdk25
  ];
}
