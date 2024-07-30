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
    # gnome-system-monitor # system monitor
    gnome.gnome-contacts # contacts manager
    gnome.gnome-music # music player
    yelp # help viewer
  ]);

  environment.systemPackages = with pkgs; [
    gnome-epub-thumbnailer # Thumbnailer for EPub and MOBI books
    mission-center # Monitor your CPU, Memory, Disk, Network and GPU usage
    celluloid # Simple GTK frontend for the mpv video player
    papers # The future gnome PDF viewer
    nautilus-python # Nautilus Python plugin support
    turtle # Git plugin for Nautilus
    gnome-network-displays
    gnome-podcasts # Official Gnome podcast app
  ];

  nixpkgs.overlays = [
    # GNOME 46: triple-buffering-v4-46
    (final: prev: {
      gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs (old: {
          src = pkgs.fetchFromGitLab  {
            domain = "gitlab.gnome.org";
            owner = "vanvugt";
            repo = "mutter";
            rev = "triple-buffering-v4-46";
            hash = "sha256-nz1Enw1NjxLEF3JUG0qknJgf4328W/VvdMjJmoOEMYs=";
          };
        });
      });
    })
  ];
}
