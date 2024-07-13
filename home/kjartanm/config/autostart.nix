{ pkgs, ... }: {
  home.file.".config/autostart/com.proton-bridge-gui.desktop".source = "${pkgs.protonmail-bridge}/share/applications/proton-bridge-gui.desktop";
  home.file.".config/autostart/com.hunterwittenborn.Celeste.desktop".source = "${pkgs.celeste}/share/applications/com.hunterwittenborn.Celeste.desktop";
}
