{ pkgs, inputs, ... }: {
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-128;
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "svg.context-properties.content.enabled" = true;
    };
    profiles = {
      kjartanMasson = {
        isDefault = true;
        # userChrome = ''@import "thunderbird-gnome-theme/userChrome.css";'';
        # userContent = ''@import "thunderbird-gnome-theme/userContent.css";'';
      };
    };
  };
  # https://www.reddit.com/r/ProtonMail/comments/snrwlm/my_experience_between_thunderbird_the_new/

  # xdg.desktopEntries.thunderbird = {
  #   # actions = {
  #   #   "profile-manager-window" = {
  #   #     exec = "thunderbird --ProfileManager";
  #   #     name = "Profile Manager";
  #   #   };
  #   # };
  #   # categories = [ "NetworkChat" "Email" "Feed" "GTK" "News" ];
  #   comment = "Read and write e-mails or RSS feeds, or manage tasks on calendars.";
  #   exec = "env GTK_THEME=adw-gtk3 ${pkgs.thunderbird}/bin/thunderbird --name thunderbird %U";
  #   genericName = "Email Client";
  #   icon = "thunderbird";
  #   mimeType = [ "message/rfc822" "x-scheme-handler/mailto" "text/calendar" "text/x-vcard" ];
  #   name = "Thunderbird";
  #   startupNotify = true;
  #   terminal = false;
  #   type = "Application";
  #   settings = {
  #     Keywords = "mail;email;e-mail;messages;rss;calendar;address book;addressbook;chat";
  #     # startupWMClass = "thunderbird";
  #     # version = "1.4";
  #   };
  # };
  home.file.".thunderbird/kjartanMasson/chrome".source = inputs.thunderbird-gnome-theme;
}
