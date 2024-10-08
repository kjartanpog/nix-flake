{ inputs, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "kjartanm";
  home.homeDirectory = "/home/kjartanm";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    FLAKE = "/home/kjartanm/Nix";
    DF = "/home/kjartanm/.dotfiles";
    DOTFILES = "/home/kjartanm/.dotfiles";
  };

  imports = [
    ./programs
    ./config
    ./email.nix
    ./defaultApps.nix
    ./LSP.nix
    # inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    # runelite
    wowup-cf
    # celeste
    newsflash
    fastfetch
    libva-utils
    vdpauinfo
    nh
    nix-output-monitor
    # spotify
    foliate
    proton-pass
    # rclone
    protonmail-bridge
    protonmail-bridge-gui
    # fragments
    discord
    morewaita-icon-theme
    yt-dlp
    # amberol
    brave
    obsidian
    # gimp
    # parabolic
    coppwr
    bustle # Graphical D-Bus message analyser and profiler
    # alpaca # Ollama client made with GTK4 and Adwaita
    davinci-resolve
    krita
    libreoffice-qt6-fresh
    eartag
    toipe
    fractal
    # quarto
    easyeffects
    pwvucontrol
    helvum
    ferdium
    # (
    #   ferdium.overrideAttrs (newAttrs: oldAttrs: { 
    #     nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.wrapGAppsHook3 ];
    #   })
    # )
    bottles
  ];

  home.shellAliases = {
    y = "yazi";
  };
}
