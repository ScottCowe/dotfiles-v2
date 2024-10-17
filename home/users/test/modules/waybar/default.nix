{
  programs.waybar = {
    enable = true;

    settings = {
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

    style = ./style.css;
  };
}
