{
  programs.waybar = {
    enable = true;

    style = ''
      #workspaces {
        margin-right: 8px;
        border-radius: 10px;
        transition: none;
        background: #383c4a;
      }

      #workspaces button {
          transition: none;
          color: #7c818c;
          background: transparent;
          padding: 5px;
          font-size: 18px;
      }

      #workspaces button.persistent {
          color: #7c818c;
          font-size: 12px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: #383c4a;
          background: #7c818c;
      }

      #workspaces button.focused {
          color: white;
      } 
    '';

    settings = {
      bar = {
        "layer" = "top";
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [ "battery" ];
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = {
            charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
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
          "tooltip-format" = "<tt>{calendar}</tt>";
          "calendar" = {
            "mode" = "month";
            "format" = {
              "months" = "<span color='#cdd6f4'><b>{}</b></span>";
              "days" = "<span color='#cdd6f4'><b>{}</b></span>";
              "weeks" = "<span color='#cdd6f4'><b>W{}</b></span>";
              "weekdays" = "<span color='#cdd6f4'><b>{}</b></span>";
              "today" = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };
        };
        "hyprland/workspaces" = {
          "all-outputs" = true;
          "format" = "{name}";
          "sort-by-number" = true;
          "active-only" = false;
        };
      };
    };
  };
}
