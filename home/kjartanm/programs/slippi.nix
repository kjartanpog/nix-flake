{ pkgs, lib, config, inputs, ... }: {

  imports = [
    # inputs.ssbm-nix.homeManagerModules.default
    inputs.slippi-nix.homeManagerModules.default
  ];

  # ssbm.slippi-launcher= {
    slippi-launcher = {
    enable = true;
    # isoPath = "Path/To/SSBM.ciso";
    # isoPath = "${config.home.homeDirectory}/Games/ROMs/GC/Slippi/Super Smash Bros. Melee (USA) (v1.02).iso";
    isoPath = "${config.home.homeDirectory}/Games/ROMs/GC/melee.iso";
    # netplayVersion = "3.4.2";
    # netplayHash = "sha256-d1iawMsMwFElUqFmwWAD9rNsDdQr2LKscU8xuJPvxYg=";
    # playbackVersion = "3.4.0";
    # playbackHash = "sha256-d1iawMsMwFElUqFmwWAD9rNsDdQr2LKscU8xuJPvxYg=";
    launchMeleeOnPlay = false;
  };
}
