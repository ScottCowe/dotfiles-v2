{
  programs.waybar = {
    enable = true;

    settings = {
      bar = {
        "layer" = "top";
        "modules-left" = ["sway/workspaces" "sway/mode"];
        "modules-center" = [ ];
        "modules-right" = ["battery" "clock"];
        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        "clock" = {
          "format-alt" = "{:%a, %d. %b  %H:%M}";
        };
      };
    };
  };
}
