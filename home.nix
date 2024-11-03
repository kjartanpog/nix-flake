{
  inputs,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;

  home.username = "kjartanm";
  home.homeDirectory = "/home/kjartanm";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    FLAKE = "/home/kjartanm/Nix";
    DF = "/home/kjartanm/.dotfiles";
    DOTFILES = "/home/kjartanm/.dotfiles";
    QT_QPA_PLATFORM = "wayland";
  };

  # home.sessionPath = [
  #   "$HOME/.config/emacs/bin"
  # ];

  imports = [
    inputs.xremap-flake.homeManagerModules.default
    ./firefox.nix
    ./emacs/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "kjartanpog";
    userEmail = "kjartan.masson@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    #LSP
    nixd
    nil

    pkgs.thunderbird-128
    komikku
    alejandra
    # runelite
    helix
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
    # obsidian
    # gimp
    # parabolic
    coppwr
    bustle # Graphical D-Bus message analyser and profiler
    # alpaca # Ollama client made with GTK4 and Adwaita
    # davinci-resolve
    krita
    # libreoffice-qt6-fresh
    eartag
    toipe
    fractal
    # quarto
    easyeffects
    pwvucontrol
    helvum
    # ferdium
    (
      ferdium.overrideAttrs (newAttrs: oldAttrs: {
        src = fetchurl {
          url = "https://github.com/ferdium/ferdium-app/releases/download/v6.7.7/Ferdium-linux-6.7.7-amd64.deb";
          hash = "sha256-5OW10sABNNYQNUgorM634j5oiBhJJby1ymH6UcmknRg=";
        };
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.wrapGAppsHook4];
      })
    )
    bottles
    iosevka
  ];

  home.shellAliases = {
    y = "yazi";
  };

  services.xremap = {
    withGnome = true;
    # watch = true;
    config = {
      keymap = [
        {
          name = "capslock to esc";
          remap = {
            "CapsLock" = "esc";
          };
          # device = {
          #   only = "AT Translated Set 2 keyboard";
          # };
        }
      ];
    };
  };

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-left = ["<Shift><Super>h"];
      move-to-workspace-right = ["<Shift><Super>l"];
      switch-to-workspace-left = ["<Control><Super>h"];
      switch-to-workspace-right = ["<Control><Super>l"];
      switch-applications = ["<Alt>Tab"];
      switch-applications-backward = ["<Shift><Alt>Tab"];
      switch-windows = ["<Super>Tab"];
      switch-windows-backward = ["<Shift><Super>Tab"];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>o";
      command = "emacsclient -e '(prot-window-popup-org-capture)'";
      name = "popup org-capture";
    };

    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "Source Code Pro 13";
      audible-bell = false;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "xremap@k0kubun.com"
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "rclone-manager@germanztz.com"
        "gsconnect@andyholmes.github.io"
        "unite@hardpixel.eu"
      ];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
      experimental-features = [
        "variable-refresh-rate"
        "scale-monitor-framebuffer"
      ];
    };
  };
}
