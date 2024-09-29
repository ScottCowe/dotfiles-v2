{ lib, config, pkgs, inputs, ... }:

with lib; let
  cfg = config.modules.bat;
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) textMateThemeFromScheme;
in {
  options.modules.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;

      config.theme = "base16";

      # Matches even less with nvim
      # config.theme = "${config.colorScheme.slug}";
      # themes."${config.colorScheme.slug}".src = textMateThemeFromScheme { scheme = config.colorScheme; };
    };
  };
}
