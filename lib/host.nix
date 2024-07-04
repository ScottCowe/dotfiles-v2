{ lib, user, ... }:

with builtins; {
  mkHost = { system, hostname, stateVersion, users }:
  let
    systemUsers = (map (u: user.mkSystenUser u) users);
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
    ]; 
  };
}
