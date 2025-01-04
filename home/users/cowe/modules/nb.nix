{ pkgs, ... }:

{
  home.packages = with pkgs; [ nb w3m ];  
}
