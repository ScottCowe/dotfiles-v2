{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;

    settings = {
      bar = {
        "layer" = "top";
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [
          "tray"
          "network"
          "battery"
        ];
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          format-full = "";
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };
        "clock" = {
          "format" = "  {:%a %e %b %H:%M}";
          "tooltip" = false;
        };
        "hyprland/workspaces" = {
          "all-outputs" = true;
          "format" = "{name}";
          "sort-by-number" = true;
          "active-only" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
        "network" = {
          "format-disconnected" = "󰯡";
          "format-ethernet" = "󰒢";
          "format-linked" = "󰖪";
          "format-wifi" = "󰖩";
          "interval" = 1;
          "tooltip" = true;
          "tooltip-format-ethernet" = "{ipaddr}";
          "tooltip-format-wifi" = "{essid} {ipaddr}";
          "tooltip-format-disconnected" = "No connection";
        };
      };
    };

    style = # css
      ''
        #workspaces {
          background-color: transparent;
        }

        #workspaces button {
          font-size: 80%;
        }

        #workspaces button.active {
          font-size: 100%;
        }

        #workspaces button.empty {

        }

        #workspaces button.persistent {

        }

        #workspaces button.special {

        }
         
        #workspaces button.visible {

        }

        #workspaces button.urgent {

        }

        #battery {
          padding-right: 8px;
          padding-left: 4px;
        }

        #network {
          padding-right: 4px;
          padding-left: 4px;
        }

        #tray {
          padding-right: 4px;
          padding-left: 4px;
        }
      '';
  };
}
