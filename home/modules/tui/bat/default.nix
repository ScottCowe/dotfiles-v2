{ lib, config, pkgs, inputs, ... }:

with lib; let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) textMateThemeFromScheme;
in {
  options.tui.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf config.tui.bat.enable {
    programs.bat = {
      enable = true;

      config.theme = "base16";

      # Matches even less with nvim
      # config.theme = "${config.colorScheme.slug}";
      # themes."${config.colorScheme.slug}".src = textMateThemeFromScheme { scheme = config.colorScheme; };
    };
  };
}
