{ inputs, ... }:

rec {
  hostname = "home-nas";
  hostId = "4e98920e";
  system = "x86_64-linux";
  stateVersion = "24.11";
  pkgs = inputs.nixpkgs; 
  services = [ 
    (import ./services/admin.nix)        
  ]; 
  networkInterfaces = {
    enp5s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];   
    };
  };
  unfreePackages = [ ];
  extraConfig = { 
    environment.systemPackages = with pkgs.legacyPackages.${system}; [ vim git bottom ];
  }; 
  timezone = "Europe/London";
}
