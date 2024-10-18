{
  programs.waybar = {
    enable = true;

    style = ''

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
