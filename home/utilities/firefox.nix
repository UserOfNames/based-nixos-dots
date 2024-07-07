{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.firefox;
in {
  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      policies = {
        Cookies = {
          Allow = [
            "https://github.com"
            "https://google.com"
            "https://lichess.org"
            "https://youtube.com"
          ];
        };
      };

      profiles = {
        default = {
          isDefault = true;
          # Extensions from NUR
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            canvasblocker
            darkreader
            multi-account-containers
            skip-redirect
            ublock-origin
            vimium
          ];

          search = {
            default = "Brave";
            force = true;

            order = [
              "Brave"
              "DuckDuckGo"
              "Wikipedia"
              "Nix Packages"
              "Nix Options"
              "Home Manager Options"
            ];

            engines = {
              "Brave" = {
                 definedAliases = [ "@brave" "@b" ];

                 urls = [{
                   template = "https://search.brave.com/search";
                   params = [
                      { name = "q"; value = "{searchTerms}"; }
                      # { name = "source"; value = "web"; }
                    ];
                }];
              };

              "Nix Packages" = {
                definedAliases = [ "@nixpackages" "@np" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "channel"; value = "unstable"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
              };

              "Nix Options" = {
                definedAliases = [ "@nixoptions" "@no" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

                urls = [{
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "channel"; value = "unstable"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
              };

              "Home Manager Options" = {
                definedAliases = [ "@homemanager" "@hm" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

                urls = [{
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    { name = "query"; value = "{searchTerms}"; }
                    { name = "release"; value = "master"; }
                  ];
                }];
              };
            };
          };

          settings = {
            # Modeled after arkenfox
            "browser.aboutConfig.showWarning" = false;

            # Startup
            "browser.startup.page" = 1;
            "browser.startup.homepage" = "about:home";
            "browser.newtabpage.enabled" = true;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.default.sites" = "";

            # Location, language, locale
            "geo.provider.network.url" = "https://location.services.mozilla.com/v1/gelocate?key=%MOZILLA_API_KEY%"; # Change geolocation provider to Mozilla (from Google)
            "geo.provider.use_gpsd" = false;
            "geo.provider.use_geoclue" = false;
            # "intl.accept_languages" = "en-US, en";
            # "javascript.use_us_english_locale" = true;

            # Privacy
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shopping.experience2023.enabled" = true;
            "datareporting.policy.dataSubmissionsEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.ping-centre.telemetry" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;
            "network.prefetch-next" = false;
            "network.dns.disablePrefetch" = true;
            "network.predictor.enabled" = false;
            "network.predictor.enable-prefetch" = false;
            "network.http.speculative-parallel-limit" = 0;
            "browser-places.speculativeConnect.enabled" = false;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.urlbar.suggest.engines" = false;
            "browser.formfill.enable" = false;
            "layout.css.visited_links_enabled" = false;
            "layout.css.font-visibility.standard" = 1; # Restrict fonts to base system fonts only
            "privacy.userContext.enabled" = true;
            "privacy.userContext.ui.enabled" = true;
            # "media.eme.enabled" = false;  # Disable DRM content
            "permissions.manager.defaultsUrl" = "";
            "webchannel.allowObject.urlWhitelist" = false;
            "permissions.delegation.enabled" = true;
            "browser.contentblocking.category" = "strict";
            "privacy.partition.serviceWorkers" = true;
            "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
            "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = false;
            "network.cookie.cookieBehavior" = 5; # Enable dFPI (total cookie protection)
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            # Might change later; enable DoH and use Quad9
            "network.trr.mode" = 2; # Enable DoH with regular DNS as a backup
            "network.trr.uri" = "https://dns.quad9.net/dns-query";
            "network.trr.custom_uri" = "https://dns.quad9.net/dns-query";

            # Sanitizing
            "privacy.sanitize.sanitizeOnShutdown" = true;
            "privacy.clearOnShutdown.history" = false;
            "privacy.clearOnShutdown.cache" = true;
            "privacy.clearOnShutdown_v2.cache" = true;
            "privacy.clearOnShutdown.downloads" = true;
            "privacy.clearOnShutdown.formdata" = true;
            "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
            "privacy.clearOnShutdown.sessions" = true;
            "privacy.clearOnShutdown.offlineApps" = true;
            "privacy.clearOnShutdown.cookies" = true;
            "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
            "privacy.clearOnShutdown.openWindows" = true;
            "privacy.clearSiteData.cache" = true;
            "privacy.clearSiteData.cookiesAndStorage" = false;  # Keep false until it respects "allow" site exceptions
            "privacy.clearSiteData.historyFormDataAndDownloads" = true;
            "privacy.cpd.cache" = true;
            "privacy.clearHistory.cache" = true;
            "privacy.cpd.formdata" = true;
            "privacy.cpd.history" = true;
            "privacy.clearHistory.historyFormDataAndDownloads" = true;
            "privacy.cpd.cookies" = true;
            "privacy.cpd.sessions" = true;
            "privacy.cpd.offlineApps" = true;
            "privacy.clearHistory.cookiesAndStorage" = true;
            "browser.send_pings" = false;

            # Security
            "browser.safebrowsing.downloads.remote.enabled" = false; # Do not send PUP info to be verified. Decreases security but those queries are sent to Google
            "browser.safebrowsing.downloads.remote.url" = "";
            "browser.fixup.alternate.enabled" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "signon.autofillForms" = false;
            "signon.formlessCapture.enabled" = false;
            "network.auth.subresource-https-auth-allow" = 1;
            "browser.cache.disk.enable" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "media.memory_cache_max_size" = 65536;
            "browser.sessionstore.privacy_level" = 2;
            "browser.shell.shortcutFavicons" = false;
            "security.tls.enable_0rtt_data" = false;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_pbm" = true;
            "dom.security.https_only_mode_send_http_background_request" = false;
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "dom.disable_window_move-resize" = true;
            "accessibility.force_disabled" = 1;
            "browser.helperApps.deleteTempFileOnExit" = true;
            "browser.uitour.enabled" = false;
            "browser.uitour.url" = "";
            "devtools.debugger.remote-enabled" = false;
            "network.IDN_show_punycode" = true;
            "widget.non-native-theme.enabled" = true;
            "signon.rememberSignons" = false;
            "permissions.memory_only" = true;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "extensions.formautofill.heuristics.enabled" = false;
            "security.ask_for_password" = 0;
            # Mixed content
            "security.mixed_content.block_display_content" = true;

            # Certificates
            "security.ssl.require_safe-negotiation" = true; # Prevent connections to sites that don't support RFC 5746, preventing possible MiTM attacks but breaking some sites.
            "security.ssl.enable_ocsp_stapling" = true;
            "security.ssl.enable_ocsp_must_staple" = true; # Breaking change
            "security.OCSP.require" = true; # Breaking change
            "security.cert_pinning.enforcement_level" = 2; # Always force public key pinning
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;

            # Misc
            "dom.battery.enabled" = false; # Do not track battery
            "middlemouse.contentLoadURL" = false;
            "pdfjs.disabled" = false;
            "pdfjs.enableScripting" = false;
            "browser.download.useDownloadDir" = false;
            "browser.download.alwaysOpenPanel" = false;
            "browser.download.manager.addToRecentDocs" = false;
            "browser.download.always_ask_before_handling_new_types" = true;
            "browser.link.open_newwindow" = 3;
            "browser.link.open_newwindow.restriction" = 0;
            "browser.urlbar.suggest.history" = false;
            "browser.urlbar.suggest.bookmark" = true;
            "browser.urlbar.suggest.openpage" = false;
            "browser.urlbar.suggest.topsites" = false;
            "browser.urlbar.autoFill" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.tabs.searchclipboardfor.middleclick" = false;
            "browser.urlbar.trending.featureGate" = false;
            "browser.urlbar.addons.featureGate" = false;
            "browser.urlbar.mdn.featureGate" = false;
            "browser.urlbar.pocket.featureGate" = false;
            "browser.urlbar.weather.featureGate" = false;
            "browser.urlbar.yelp.featureGate" = false;
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.contentanalysis.default_allow" = false;
            "browser.tabs.closeWindowWithLastTab" = false;

            # Always leave on
            "extensions.blocklist.enabled" = true;
            "network.http.referer.spoofSource" = false;
            "security.dialog_enable_delay" = 1000;
            "privacy.firstparty.isolate" = false; # Old setting that is no longer maintained and disables better options
            "extensions.webcompat.enable_shims" = true;
            "security.tls.version.enable-deprecated" = false;
            "extensions.webcompat-reporter.enabled" = false;
            "dom.event.contextmenu.enabled" = true;
            "plugins.enumerable_names" = "";
            "extensions.quarantinedDomains.enabled" = true;



            # UI

            # One-offs
            "browser.tabs.firefox-view" = false;
            "browser.urlbar.shortcuts.history" = false;
            "browser.urlbar.shortcuts.tabs" = false;

            # UI state
            "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["panic-button"],"unified-extensions-area":["skipredirect_sblask-browser-action","canvasblocker_kkapsner_de-browser-action","_testpilot-containers-browser-action","ublock0_raymondhill_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","customizableui-special-spring1","urlbar-container","customizableui-special-spring2","downloads-button","fxa-toolbar-menu-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks","bookmarks-menu-button"]},"seen":["save-to-pocket-button","developer-button","skipredirect_sblask-browser-action","canvasblocker_kkapsner_de-browser-action","_testpilot-containers-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","unified-extensions-area","widget-overflow-fixed-list"],"currentVersion":19,"newElementCount":13}'';

            # Activity stream
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.system.topstories" = false;
            "browser.newtabpage.activity-stream.topSitesRows" = 3;
            "browser.newtabpage.activity-stream.showRecentSaves" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
            "browser.partnerlink.campaign.topsites" = "";

            # Disable pocket, instructions found in https://www.reddit.com/r/linux/comments/zabm2a/
            "extensions.pocket.enabledd" = false;
            "extensions.pocket.api" = "0.0.0.0";
            "extensions.pocket.loggedOutVariant" = "";
            "extensions.pocket.oAuthConsumerKey" = "";
            "extensions.pocket.onSaveRecs" = false;
            "extensions.pocket.onSaveRecs.locales" = "";
            "extensions.pocket.showHome" = false;
            "extensions.pocket.site" = "0.0.0.0";
            "browser.newtabpage.activity-stream.pocketCta" = "";
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "services.sync.prefs.sync-seen.services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          };
        };
      };
    };
  };
}
