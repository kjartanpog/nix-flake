{ pkgs, inputs, ... }: {
  home.file.".local/share/applications/kitty.desktop".text = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=kitty
    GenericName=Terminal emulator
    Comment=Fast, feature-rich, GPU based terminal
    TryExec=kitty
    StartupNotify=true
    Exec=kitty
    Icon=${inputs.whiskers}/whiskers_512x512.png
    Categories=System;TerminalEmulator;
  '';
  programs.kitty = {
    enable = true;
    themeFile = "Rosé Pine";
    font = {
      name = "Hasklug Nerd Font";
      size = 14;
    };
    settings = {
      # shell = "${pkgs.fish}/bin/fish";
      window_padding_width = 4;
      hide_window_decorations = true;
    };
    extraConfig = ''
      background #000000
      wayland_titlebar_color background
    '';
  };
}
