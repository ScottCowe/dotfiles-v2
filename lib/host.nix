{ lib, user, ... }:

with builtins; {
  mkHost = { system, hostname, stateVersion, users }:
  let
    systemUsers = (map (u: user.mkSystemUser u) users);
    hmUsers = (map (u: user.mkHMUser lib.mkMerge [ u { stateVersion = stateVersion; }]) users);
  in lib.nixosSystem {
    modules = [
      {
        imports = [] ++ systemUsers;

        networking = {
          hostName = "${hostname}";
          networkmanager.enable = true;
        };

        system.stateVersion = "${stateVersion}";
      }

      ../systems/${hostname}

      home-manager.nixosModule.home-manager {
        imports = [] ++ hmUsers;
      }
    ]; 
  };
}
