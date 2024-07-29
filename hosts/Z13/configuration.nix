# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ../../common/configuration.nix
    ./users.nix
    ./hardware-configuration.nix
  ];

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

  # Attempt to fix Alsa issues
  # (From nix-hardware)
  environment.etc."asound.conf".source = ./asound.conf;
}
