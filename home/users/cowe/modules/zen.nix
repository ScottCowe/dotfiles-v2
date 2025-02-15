{ inputs, ... }:

{
  imports = [ inputs.zen-browser.packages."x86_64-linux".default ];
}
