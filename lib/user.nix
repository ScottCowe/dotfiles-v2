{ lib, ... }:

{
  mkHMUser = { name, stateVersion, ... }: 
  {
    home-manager.users."${name}" = lib.mkMerge [
      {
        home.stateVersion = "${stateVersion}";
        home.username = "${name}";
        home.homeDirectory = "/home/${name}/";
      }

      ../users/${name}
    ]; 
  };

  mkSystemUser = { name, groups, uid, shell, ... }:
  {
    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      extraGroups = groups;
      uid = uid;
      initialPassword = "password";
      shell = shell;
    }; 
  };
}
