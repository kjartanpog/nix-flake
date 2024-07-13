{ config, lib, ... }: {

  services.xserver.desktopManager.gnome.extraGSettingsOverrides =
    lib.mkIf config.services.xserver.desktopManager.gnome.enable ''
      [org.gnome.mutter]
      experimental-features=[ 'scale-monitor-framebuffer' ]
    '';
}
