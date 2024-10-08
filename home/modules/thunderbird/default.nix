{ lib, config, name, ... }:

with lib; let 
  cfg = config.modules.thunderbird;
in {
  options.modules.thunderbird = {
    enable = mkEnableOption "thunderbird";
  };

  config = mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;

      profiles."${name}" = {
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        userChrome = ''
          /* On macos, the titlebar has to be made high enough */
          #navigation-toolbox, #tabmail-tabs,  #tabmail-arrowscrollbox{ /* Outer tab containers */
              min-height: 41px !important;
           }

          .icons-beside-text {
              background-color: #3F3F46;
              border: 0px !important;
          }
           
          .tabmail-tab { /* Give the tabs a bit of a margin */
              margin-top: 1px !important;
              margin-bottom: 4px !important;
              margin-left: 2px !important;
              margin-right: 2px !important;
          }
           
          .tab-background { /* Round tab corners and add a bit of padding */
              padding: 6px;
              border-radius: 4px;
          }
           
          .tab-line { /* Eliminate the line at the top of the tab */
              height: 0px !important;
              display: none !important;
          }

          .tabmail-tab::after, .tabmail-tab::before { /* Eliminate the line between inactive tabs */
              border: none !important;
          }

          .toolbarbutton-1, .searchBox, .themeableSearchBox { /* Eliminate borders, round corners, and increase height on buttons and search bars */
              border: none !important;
              border-radius: 5px !important;
              height: 31px !important;
          }

          .sidebar-header {
              height: 40px !important;
          }

          .mail-toolbox {
              margin-bottom: -3px !important;
          }

          .contentTabAddress {
              padding-left: 0px !important;
              padding-right: 2px !important;
          }

          .contentTabUrlInput {
              height: 25px !important;
              margin-top: 8px !important;
              margin-left: 0px !important;
              padding-left: 25px !important;
          }

          .contentTabSecurity {
              padding-top: 7px;
              padding-right: 3px;
          }
          .panel-arrowbox { /* hide the arrow on popup menus */
              display: none;
          }

          .panel-arrowcontent { /* Eliminate borders, round corners, and increase padding on popup menus */
              padding: 5px !important;
              border-radius: 5px;
              border: none;
          }

          .spaces-toolbar:not([hidden]) {
              margin-top: 0px;
          }

          .tab-background[selected="true"] {
              box-shadow: var(--tab-shadow) !important;
          }

          .tabmail-tab:hover .tab-background:not([selected="true"]) {
              background-color: color-mix(in srgb, currentColor 11%, transparent) !important;
          }

          @media (-moz-content-prefers-color-scheme:light) {
            /* Light Theme */
              :root {
                  --tab-shadow: 0px 0px 4px #888;
                  --toolbar-field-background-color: rgb(230, 230, 234) !important;
            }
          }

          @media (-moz-content-prefers-color-scheme:dark) {
            /* Dark Theme */
            :root {
              --tab-shadow: 0px 0px 4px #111 !important;
              --toolbar-field-background-color: rgb(28, 27, 34) !important;
            }
          }

          .tab-close-button {
              padding: 6px !important;
          }

          .tab-close-icon {
              width: 12px !important;
              height: 12px !important;
          }

          .contentTabToolbar {
              height: 40px !important;
          }

          #urlbar-background {
              border: none;
              box-shadow: none !important;
          }
        '';
      };
    };
  };
}
