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
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    nh
    nix-output-monitor
    spotify
    foliate
    proton-pass
    rclone
    protonmail-bridge
    protonmail-bridge-gui
    # fragments
    discord
    morewaita-icon-theme
    yt-dlp
    amberol
  ];
}
