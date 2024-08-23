{ lib, config, ... }:

with lib; {
  options.pipewire = {
    enable = mkEnableOption "pipewire";
  };

  config = mkIf config.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
