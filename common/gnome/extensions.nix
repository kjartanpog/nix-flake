{ pkgs, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    xremap
    caffeine
    appindicator
    rclone-manager
    gsconnect
  ];
}
