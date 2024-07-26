{ lib, config, ... }:

with lib; {
  options.boot = { 
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable GRUB and other boot stuff
      '';
    };

    theme = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = literalExpression "pkgs.nixos-grub2-theme";
      description = mdDoc ''
        What theme to use for GRUB
      '';
    };
  };

  config = mkIf config.boot.enable {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        theme = config.boot.theme; 
      };
    };
  };
}
