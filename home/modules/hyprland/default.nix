{ pkgs, lib, config, gpuType, ... }:

with lib; let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland = { 
    enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      wl-clipboard
      grim slurp
    ]; 

    home.sessionVariables = mkIf (gpuType == "nvidia") {
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    wayland.windowManager.hyprland.extraConfig = ''
      # Given up on trying to get peggle to work (for now)
      # windowrule = size 640 480, ^(steam_app_3480)$ 
      # windowrule = maximize, ^(steam_app_3480)$  
      # windowrule = fullscreenstate 0 0, ^(steam_app_3480)$  

      # To fix ghost monitor issue, apparantly a kernel/driver bug
      monitor = Unknown-1, disable
      monitor = eDP-1, 2256x1504, 1920x0, 2 
      monitor = DP-3, 1920x1080, 0x0, 1
    '';

    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      "exec-once" = "waybar";
        
      bind = [
        "$mod, M, exec, wlogout"
        "$mod, Return, exec, kitty"
        "$mod SHIFT, Q, killactive"
        "$mod, E, exec, kitty lf"
        "$mod, D, exec, rofi -show drun"
        "$mod, F, fullscreen"
        ''$mod, S, exec, grim -g "$(slurp -w 0)" - | wl-copy --type image/png''
        "$mod, B, exec, firefox"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        "$mod, left, resizeactive, -50 0"
        "$mod, right, resizeactive, 50 0"
        "$mod, up, resizeactive, 0 -50"
        "$mod, down, resizeactive, 0 50"
      ]      
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        "col.active_border" = "rgb(${config.colorScheme.palette.base0D})";
        "col.inactive_border" = "rgba(00000000)";
      };

      decoration = {
        rounding = 0;

        blur.enabled = false;
        drop_shadow = false;
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "windows, 1, 7, default, popin 80%"
          "workspaces, 1, 6, default, slide"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
      };
    };
  };
}
