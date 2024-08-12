{ inputs, ... }:

rec {
  hostname = "home-nas";
  hostId = "4e98920e";
  system = "x86_64-linux";
  stateVersion = "24.11";
  nixpkgs = inputs.nixpkgs; 
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
  extraConfig = let
    pkgs = nixpkgs.legacyPackages.${system};
    # lib = nixpkgs.lib;
  in { 
    environment.systemPackages = with pkgs; [ vim git bottom neofetch ];
  }; 
  timezone = "Europe/London";
}
