{ lib, config, pkgs, inputs, ... }:
  let
    myBookmarks = [
      {
        name = "wikipedia";
        tags = [ "wiki" ];
        keyword = "wiki";
        url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
      }
      {
        name = "kernel.org";
        url = "https://www.kernel.org";
      }
      {
        name = "Nix sites";
        toolbar = true;
        bookmarks = [
          {
            name = "homepage";
            url = "https://nixos.org/";
          }
          {
            name = "wiki";
            tags = [ "wiki" "nix" ];
            url = "https://wiki.nixos.org/";
          }
        ];
      }
    ];
  in
{
  home.packages = with pkgs; [
    firefoxpwa
    fx-cast-bridge
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      nativeMessagingHosts = with pkgs; [
        gnomeExtensions.gsconnect
        fx-cast-bridge
        firefoxpwa
      ];
    };
    policies = {
      ManagedBookmarks = myBookmarks;
      ExtensionSettings = {
        "fx_cast@matt.tf" = {
          install_url = "https://github.com/hensm/fx_cast/releases/download/v0.3.1/fx_cast-0.3.1.xpi";
          installation_mode = "force_installed";
        };
        "gsconnect@andyholmes.github.io" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gsconnect/latest.xpi";
          installation_mode = "force_installed";
        };
        "firefoxpwa@filips.si" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/pwas-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.kjartanm = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        multi-account-containers
        facebook-container
        proton-pass
        proton-vpn
        side-view
        # tridactyl
        vimium
      ];
      id = 0;
      isDefault = true;

      # Betterfox
      extraConfig = (builtins.readFile "${inputs.betterfox}/user.js") +
      # Betterfox overrides
      ''
        user_pref("browser.newtabpage.activity-stream.feeds.topsites", true);
      '';

      # Gnome Theme
      userContent = ''@import "${inputs.firefox-gnome-theme}/userContent.css";'';
      userChrome = ''@import "${inputs.firefox-gnome-theme}/userChrome.css";'' + "\n" + ''
        #TabsToolbar #firefox-view-button {
          display: none;
        }
        #sidebar-box {
          max-width: none !important;
          min-width: 0px !important;
        }
      '';

      bookmarks = myBookmarks;

      settings = {

      # Enable the Browser Console command line
        "devtools.chrome.enabled" = true;

      # Don't ask user for new extension privelages
        "extensions.autoDisableScopes" = 0;

        "privacy.userContext.enabled" = true;

      # Enable custom stylesheets (required for Gnome theme)
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;

      # Gnome Theme
        "gnomeTheme.hideSingleTab" = true;

      # Don't display bookmarks icon on toolbar
        "browser.toolbars.bookmarks.visibility" = "never";

      # Disable Firefox sync
        "identity.fxaccounts.enabled" = false;

      # Disable Firefox view
        "browser.tabs.firefox-view" = false;
        "browser.tabs.firefox-view-next" = false;
        "browser.tabs.firefox-view-newIcon" = false;
        "browser.firefox-view.feature-tour" = ''"{\"screen\":\"\",\"complete\":true}"'';

      # Manage pinned shortcuts
        "browser.newtabpage.pinned" = [
          {
            # url = "https://account.proton.me/drive";
            url = "https://drive.proton.me";
            label = "Drive";
          }
          {
            # url = "https://account.proton.me/mail";
            url = "https://mail.proton.me";
            label = "Mail";
          }
          {
            url = "about:blank?x";
            baseDomain = "";
          }
        ];

      # Remove pinned search engine shortcuts
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
      # Show weather on new tab page
        "browser.newtabpage.activity-stream.system.showWeather" = true;
      # Disable sponsored top sites
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      # Show wallpaper on new tab page
          # "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = true;
      };

      # Containers
      containersForce = true;
      containers = {
        GooTube = {
          id = 1;
          color = "toolbar";
          icon = "fingerprint";
        };
        # Zuckerberg = {
        #   id = 2;
        #   color = "toolbar";
        #   icon = "fingerprint";
        # };
      };

      # Search Engines
      search = {
        force = true;
        default = "Brave Search";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
                { name = "channel"; value = "unstable"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
                { name = "channel"; value = "unstable"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "Home Manager Options" = {
            urls = [{
              template = "https://home-manager-options.extranix.com/";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
          "Arch Wiki" = {
            urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
            definedAliases = [ "@aw" ];
            icon = builtins.fetchurl {
              url = "https://archlinux.org/static/favicon.51c13517c44c.png";
              sha256 = "1h8x2m3r309z1y6ip0n7481rg9rwhgp2ca72n07dwrmshbhymylp";
            };
          };
          "NixOS Wiki" = {
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}&go=Go"; }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "nw" ];
          };
          "Brave Search" = {
            urls = [{ template = "https://search.brave.com/search?q={searchTerms}&source=web"; }];
            definedAliases = [ "@brave" "@br" ];
            icon = builtins.fetchurl {
              url = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
              sha256 = "1ryb2xc4hych0qpfg7bwrjk3374ck3382flmjqpvci11vw7zhc15";
            };
          };
        };
      };
    };
  };
}
