# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  users.users.kjartanm = {
    isNormalUser = true;
    description = "Kjartan Masson";
    extraGroups = ["networkmanager" "wheel"];
  };

  # Needed for xremap
  users.groups = {
    uinput.members = ["kjartanm"];
    input.members = ["kjartanm"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "kjartanm" = import ./home.nix;
    };
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };

  networking.hostName = "Z13";

  # Set your time zone.
  time.timeZone = "Atlantic/Reykjavik";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "is_IS.UTF-8";
    LC_IDENTIFICATION = "is_IS.UTF-8";
    LC_MEASUREMENT = "is_IS.UTF-8";
    LC_MONETARY = "is_IS.UTF-8";
    LC_NAME = "is_IS.UTF-8";
    LC_NUMERIC = "is_IS.UTF-8";
    LC_PAPER = "is_IS.UTF-8";
    LC_TELEPHONE = "is_IS.UTF-8";
    LC_TIME = "is_IS.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "is";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "is-latin1";

  hardware.uinput.enable = true;

  boot.plymouth = {
    enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.ollama = {
    enable = true;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.2";
    loadModels = [
      "llama3.1:8b"
    ];
    environmentVariables = {
      OLLAMA_KEEP_ALIVE = "3m";
    };
  };

  environment.etc."programs.sqlite".source = inputs.programsdb.packages.${pkgs.system}.programs-sqlite;
  programs.command-not-found.dbPath = "/etc/programs.sqlite";

  services.flatpak.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Linux Vendor Firmware Service
  services.fwupd.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #   wireplumber.enable = true; # A modular session / policy manager for PipeWire
    #   # audio.enable = true; # Use PipeWire as the primary sound server
    #   # lowLatency = {
    #   #   enable = true;
    #   #   quantum = 64;
    #   #   rate = 48000;
    #   # };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import inputs.emacs-overlay)
  ];

  # Prefer native wayland over xwayland for supported nix packages
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    geary # email reader
    evince # document viewer
    totem # video player
    yelp # help viewer
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    protonvpn-gui
    fx-cast-bridge
    unzip
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    ripgrep

    # Gnome
    gnome-epub-thumbnailer # Thumbnailer for EPub and MOBI books
    resources # Monitor your system resources and processes
    celluloid # Simple GTK frontend for the mpv video player
    papers # The future gnome PDF viewer
    nautilus-python # Nautilus Python plugin support
    gnome-network-displays
    gnome-podcasts # Official Gnome podcast app
    gnomeExtensions.xremap
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.unite
    gnomeExtensions.pip-on-top
  ];

  fonts = {
    packages = with pkgs; [
      inter
      iosevka-comfy.comfy
      iosevka-comfy.comfy-wide-motion
      iosevka-comfy.comfy-wide-duo
      iosevka-comfy.comfy-motion-duo
      (nerdfonts.override {
        fonts = [
          "SourceCodePro"
          "Hasklig"
          "IBMPlexMono"
        ];
      })
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
