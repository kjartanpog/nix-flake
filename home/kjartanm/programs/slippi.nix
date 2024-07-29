{ config, inputs, ... }: {

  imports = [
    # inputs.ssbm-nix.homeManagerModules.default
    inputs.slippi-nix.homeManagerModules.default
  ];

  # ssbm.slippi-launcher= {
  slippi.launcher = {
    enable = true;
    # isoPath = "Path/To/SSBM.ciso";
    isoPath = "${config.home.homeDirectory}/Games/Slippi/Super Smash Bros. Melee (USA) (v1.02).iso";
    netplayVersion = "3.4.1";
    netplayHash = "sha256-uqy9YQnvryTHmskzlX+4st1VacnHbpC2gdC+PgvFUlA=";
    # playbackVersion = "3.4.0";
    # playbackHash = "sha256-d1iawMsMwFElUqFmwWAD9rNsDdQr2LKscU8xuJPvxYg=";
    launchMeleeOnPlay = false;
  };
}
