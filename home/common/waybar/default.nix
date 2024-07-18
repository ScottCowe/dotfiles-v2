{ lib, config, ... }:

with lib; {
  options.common.waybar = { 
    enable = mkEnableOption "waybar"; 
  };

  config = mkIf config.common.waybar.enable {
    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          spacing = 7;
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            # music
          ];
          modules-right = [
            "tray"
            "pulseaudio"
            "network"
            "battery"
            "clock"
          ];
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
          };
          "tray" = {
            spacing = 10;
          };
          "clock" = {
            tooltip-format = "{:%A}";
            format = "{:%H:%M:%S  %d/%m/%y}";
            interval = 1;
          };
          "battery" = {
            states = {
              warning = "20";
            };
            format = "{icon}";
            format-icons = [
              "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
            ];
            format-charging = "󰂄";
            format-warning = "󰂃";
            tooltip-format = "{capacity}% capacity";
          };
          "network" = {
            format-wifi = "󰤨";
            format-disconnected = "󰤭";
            tooltip-format = "Connected to {essid}";
          };
          "pulseaudio" = {
            format = "{icon}";
            format-muted = "󰖁";        
				    format-icons = {
					    default = [
                "" "" "󰕾"
              ];
				    };
				    tooltip-format = "{volume}% volume";
          };
        };
      };
    };
  };
}
