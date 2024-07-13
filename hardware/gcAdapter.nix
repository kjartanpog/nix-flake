{ inputs, pkgs, ... }: {

  imports = [
    inputs.ssbm-nix.nixosModule
  ];

  ssbm.overlay.enable = true;

  ssbm.gcc.oc-kmod.enable = true;

  services.udev.packages = [
    pkgs.dolphinEmu
  ];
}
