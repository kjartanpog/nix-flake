{ ... }: {
  environment.sessionVariables = {
    # QT_WAYLAND_DECORATION = "gnome";
    # QT_QPA_PLATFORM = "wayland";
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    VDPAU_DRIVER = "radeonsi";
    LIBVA_DRIVER_NAME = "radeonsi";
  };
}
