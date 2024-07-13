{ inputs, ... }:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

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
}
