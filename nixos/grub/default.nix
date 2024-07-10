{ lib, config, ... }:

with lib; {
  options.grub = { 
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable GRUB
      '';
    };

    theme = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = literalExpression "pkgs.nixos-grub2-theme";
      description = mdDoc ''
        What theme to use
      '';
    };
  };

  config = mkIf config.grub.enable {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        theme = config.grub.theme; 
      };
    };
  };
}
