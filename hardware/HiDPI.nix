{ ... }: {

  environment.sessionVariables.HIDPI = "1";

  # services.xserver.desktopManager.gnome.extraGSettingsOverrides =
  #   lib.mkIf ( config.services.xserver.desktopManager.gnome.enable == true ) ''
  #     [org.gnome.mutter]
  #     experimental-features=[ 'scale-monitor-framebuffer' ]
  #   '';
}
