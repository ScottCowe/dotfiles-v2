{ lib, nix-colors, ... }:

{
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

  mkHMUser = { name, colorScheme, ... }: stateVersion:
  {
    home-manager.users."${name}" = lib.mkMerge [
      {
        home.stateVersion = "${stateVersion}";
        home.username = "${name}";
        home.homeDirectory = "/home/${name}";

      }

      ../users/${name}

      {
        imports = [
          nix-colors.homeManagerModules.default
        ];

        config.colorScheme = colorScheme;
      }
    ];
  };
}
