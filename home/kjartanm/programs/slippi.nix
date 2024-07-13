{ config, inputs, ... }: {

  imports = [
    inputs.ssbm-nix.homeManagerModules.default
  ];

  ssbm.slippi-launcher= {
    enable = true;
    # isoPath = "Path/To/SSBM.ciso";
    isoPath = "${config.home.homeDirectory}/Games/Slippi/Super Smash Bros. Melee (USA) (v1.02).iso";
  };
}
