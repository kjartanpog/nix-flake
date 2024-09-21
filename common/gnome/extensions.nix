{ pkgs, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    xremap
    caffeine
    # appindicator
    # rclone-manager
    gsconnect
    # peek-top-bar-on-fullscreen
    # highlight-focus
    unite
    # paperwm
    # dim-background-windows
    pip-on-top
  ];
}
