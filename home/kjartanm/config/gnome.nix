{ lib, config, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # font-name = "Inter Variable 11";
      # font-name = "Inter Variable, Light 11";
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-left = ["<Shift><Super>h"];
      move-to-workspace-right = ["<Shift><Super>l"];
      switch-to-workspace-left = ["<Control><Super>h"];
      switch-to-workspace-right = ["<Control><Super>l"];
      switch-applications = ["<Alt>Tab"];
      switch-applications-backward = ["<Shift><Alt>Tab"];
      switch-windows = ["<Super>Tab"];
      switch-windows-backward = ["<Shift><Super>Tab"];
    };

    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "Source Code Pro 13";
      audible-bell = false;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "xremap@k0kubun.com"
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "rclone-manager@germanztz.com"
        "gsconnect@andyholmes.github.io"
      ];
    };

    "org/gnome/epiphany/web" = {
      # enable-webextensions = true;
      # hardware-acceleration-policy = "always";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
      experimental-features =
        # lib.mkIf ( config.environment.sessionVariables.HIDPI == "1" )
      [
        # "variable-refresh-rate"
        "scale-monitor-framebuffer"
      ];
    };
    # "org/gnome/desktop/interface" = {
    #   gtk-theme = "adw-gtk3";
    # };
  };
}
