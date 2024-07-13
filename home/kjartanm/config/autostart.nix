{ pkgs, ... }: {
  home.file.".config/autostart/com.hunterwittenborn.Celeste.desktop".source = "${pkgs.celeste}/share/applications/com.hunterwittenborn.Celeste.desktop";
}
