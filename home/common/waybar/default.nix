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
          spacing = 0;
          height = 34;
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "tray"
            "memory"
            "network"
            "pulseaudio"
            "battery"
          ];
          "hyprland/workspaces" = {
            on-click = "activate";
            format = "{icon}";
            format-icons = {
              "default" = "";
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              # "active" = "󱓻";
              # "urgent" = "󱓻";
            };
            persistent_workspaces = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
            };
          };
          memory = {
            interval = 5;
            format = "󰍛 {}%";
            max-length = 10;
          };
          tray = {
            spacing = 10;
          };
          clock = {
            tooltip-format = "{calendar}";
            format-alt = "  {:%a, %d %b %Y}";
            format = "  {:%I:%M %p}";
          };
          network = {
            format-wifi = "{icon}";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
            format-ethernet = "󰀂";
	          format-alt = "󱛇";
            format-disconnected = "󰖪";
	          tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
            tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
	          tooltip-format-disconnected = "Disconnected";
	          interval = 5;
	          nospacing = 1;
          };
          pulseaudio = {
            format = "{icon}";
            format-bluetooth = "󰂰";
            nospacing = 1;
            tooltip-format = "Volume : {volume}%";
            format-muted = "󰝟";
            format-icons = {
              headphone = "";
              default = [ "󰖀" "󰕾" "" ];
            };
            scroll-step = 1;
          };
          battery = {
            format = "{capacity}% {icon}";
            format-icons = {
              charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
              default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            };
            format-full = "Charged ";
            interval = 5;
            states = {
              warning = 20;
              critical = 10;
            };
            tooltip = false;
          };
        };
      };

      style = with config.colorScheme.palette; ''
        * {
          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: JetBrainsMono Nerd Font;
          font-size: 13px;
        }

        window#waybar {
          background-color: #${base00};
          transition-property: background-color;
          transition-duration: 0.5s;
        }

        window#waybar.hidden {
          opacity: 0.5;
        }

        #workspaces {
          background-color: transparent;
        }

        #workspaces button {
          all: initial;
          /* Remove GTK theme values (waybar #1351) */
          min-width: 0;
          /* Fix weird spacing in materia (waybar #450) */
          box-shadow: inset 0 -3px transparent;
          /* Use box-shadow instead of border so the text isn't offset */
          padding: 6px 18px;
          margin: 6px 3px;
          border-radius: 4px;
          background-color: #${base01};
          color: #${base05};
        }

        #workspaces button.active {
          color: #${base01};
          background-color: #${base05};
        }

        #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          color: #${base01};
          background-color: #${base05};
        }

        #workspaces button.urgent {
          background-color: #${base05};
        }

        #memory,
        #battery,
        #pulseaudio,
        #network,
        #clock,
        #tray {
          border-radius: 4px;
          margin: 6px 3px;
          padding: 6px 12px;
          background-color: #${base0C};
          color: #${base01};
        }

        #battery.warning,
        #battery.critical,
        #battery.urgent {
          background-color: #${base08};
          color: #${base01};
        }

        #battery.charging {
          background-color: #${base0B};
          color: #${base01};
        }

        #pulseaudio {
          background-color: #${base0C};
        }

        #network {
          background-color: #${base0C};
          padding-right: 17px;
        }

        #clock {
          font-family: JetBrainsMono Nerd Font;
          background-color: #${base0C};
        }

        tooltip {
          border-radius: 8px;
          padding: 15px;
          background-color: #${base00};
        }

        tooltip label {
          padding: 5px;
          background-color: #${base00};
        }
      '';
    };
  };
}
