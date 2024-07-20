{ pkgs, ... }: {

  # Prefer native wayland over xwayland for supported nix packages
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  imports = [
    ./extensions.nix
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs; [
    epiphany # web browser
    geary # email reader
    evince # document viewer
    totem # video player
    gnome-system-monitor # system monitor
    gnome.gnome-contacts # contacts manager
    gnome.gnome-music # music player
    yelp # help viewer
  ]);

  environment.systemPackages = with pkgs; [
    gnome-epub-thumbnailer # Thumbnailer for EPub and MOBI books
    mission-center
    celluloid
    papers
    nautilus-python
    turtle
  ];
}
