{ lib, config, pkgs, inputs, ... }:

with lib; {
  options.graphical.firefox = { 
    enable = mkEnableOption "firefox"; 
  };

  config = mkIf config.graphical.firefox.enable {
    programs.firefox = {
      enable = true;

      profiles.cowe = {
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };
            "MyNixOS" = {
              urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://mynixos.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@no" ];
            };
            "YouTube" = {
              urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
              iconUpdateURL = "https://www.youtube.com/s/desktop/4feff1e2/img/favicon_96x96.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@yt" ];
            };
            "Tesco" = {
              urls = [{ template = "https://www.tesco.com/groceries/en-GB/search?query={searchTerms}"; }];
              iconUpdateURL = "https://www.tesco.com/groceries/web-assets/touch-icons/tesco/favicon-9636e8991a.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@ts" "@tesco" ];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "eBay".metaData.alias = "@ebay";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
          };
        };

        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          ublock-origin
          firefox-color
          stylus
        ];
      };

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = false;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; 
        DisplayMenuBar = "default-off"; 
        SearchBar = "unified";
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
        NoDefaultBookmarks = true;
        DisableMasterPasswordCreation = true;
        StartPage = "previous-session";

        Preferences = {
          "extensions.pocket.enabled" = false;
          "extensions.screenshots.disabled" = true;
          "browser.topsites.contile.enabled" = false;
          "browser.formfill.enable" = false;
          "browser.search.suggest.enabled" = false;
          "browser.search.suggest.enabled.private" = false;
          "browser.urlbar.suggest.searches" = true;
          "browser.urlbar.showSearchSuggestionsFirst" = true;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.system.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "dom.forms.autocomplete.formautofill" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
        };

        "3rdparty".Extensions = {
          "uBlock0@raymondhill.net".adminSettings = {
					  userSettings = rec {
						  uiTheme = "dark";
						  uiAccentCustom = true;
						  uiAccentCustom0 = "#8300ff";
						  cloudStorageEnabled = mkForce false; # Security liability?
						  importedLists = [
							  "https://filters.adtidy.org/extension/ublock/filters/3.txt"
							  "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
						  ];
						  externalLists = lib.concatStringsSep "\n" importedLists;
					  };
					  selectedFilterLists = [
						  "CZE-0"
						  "adguard-generic"
						  "adguard-annoyance"
						  "adguard-social"
						  "adguard-spyware-url"
						  "easylist"
						  "easyprivacy"
						  "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
						  "plowe-0"
						  "ublock-abuse"
						  "ublock-badware"
						  "ublock-filters"
						  "ublock-privacy"
						  "ublock-quick-fixes"
						  "ublock-unbreak"
						  "urlhaus-1"
					  ];
				  };
			  };
      };
    };
  };
}
