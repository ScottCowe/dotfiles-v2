{ lib, config, pkgs, ... }:

with lib; {
  options.common.fonts = {
    enable = mkEnableOption "fonts";
  };

  config = mkIf config.common.fonts.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    ]; 
  };
}
