{ inputs, ... }:

{
  hostname = "home-nas";
  system = "x86_64-linux";
  stateVersion = "24.11";
  pkgs = inputs.nixpkgs; 
  services = [ 
    (import ./services/admin.nix)        
  ]; 
  networkInterfaces = {
    enp4s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];   
    };
  };
  unfreePackages = [ ];
  extraConfig = {

  }; 
  timezone = "Europe/London";
}
