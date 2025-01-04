{ pkgs, ... }:

{
  home.packages = with pkgs; [ rofi-wayland rofi-calc ];
}
