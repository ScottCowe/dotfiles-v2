{ lib, config, ... }:

with lib; {
  options.nvidia = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable Nvidia drivers 
      '';
    };

    package = mkOption {
      type = types.nullOr types.path;
      default = config.boot.kernelPackages.nvidiaPackages.production;
      example = literalExpression "config.boot.kernelPackages.nvidiaPackages.beta";
      description = mdDoc ''
        Package to use
      '';
    };
  };

  config = mkIf config.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.nvidia.package;
    };
  };
}
