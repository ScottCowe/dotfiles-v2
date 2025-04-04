{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      size = 12;
    };

    settings = {
      clear_all_shortcuts = true;
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      enable_audio_bell = false;
      allow_remote_control = true;
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
}
