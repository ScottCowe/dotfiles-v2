{ pkgs, lib, config, ... }:

with lib; {  
  options.kitty = { 
    enable = mkEnableOption "kitty"; 
  };
  
  config = mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;

      font =  {
        name = "FiraCode Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
        size = 12;
      };

      settings = with config.colorScheme.palette; {
        clear_all_shortcuts = true;
        enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        enable_audio_bell = false;

        foreground = "#${base05}";
        background = "#${base00}";
        selection_background = "#${base05}";
        selection_foreground = "#${base00}";
        url_color  = "#${base04}";
        cursor = "#${base05}";
        cursor_text_color = "#${base00}";
        active_border_color = "#${base03}";
        inactive_border_color = "#${base01}";
        active_tab_background = "#${base00}";
        active_tab_foreground = "#${base05}";
        inactive_tab_background = "#${base01}";
        inactive_tab_foreground = "#${base04}";
        tab_bar_background = "#${base01}";
        wayland_titlebar_color = "#${base00}";
        macos_titlebar_color = "#${base00}";

        color0 = "#${base00}";
        color1 = "#${base08}";
        color2 = "#${base0B}";
        color3 = "#${base0A}";
        color4 = "#${base0D}";
        color5 = "#${base0E}";
        color6 = "#${base0C}";
        color7 = "#${base05}";
        color8 = "#${base03}";
        color9 = "#${base09}";
        color10 = "#${base01}";
        color11 = "#${base02}";
        color12 = "#${base04}";
        color13 = "#${base06}";
        color14 = "#${base0F}";
        color15 = "#${base07}";
      };

      keybindings = {
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";
        "alt+enter" = "new_tab_with_cwd";
        "alt+q" = "close_tab";
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
        "alt+0" = "goto_tab 10";
        "alt+shift+enter" = "new_window_with_cwd";
        "alt+shift+q" = "close_window";
        "alt+h" = "neighboring_window left";
        "alt+j" = "neighboring_window bottom";
        "alt+k" = "neighboring_window top";
        "alt+l" = "neighboring_window right";
      };
    };
  };
}
