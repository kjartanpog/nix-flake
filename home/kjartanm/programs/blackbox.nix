{ lib, inputs, pkgs, ... }:
  let
    blackbox-sixel = pkgs.blackbox-terminal.override { sixelSupport = true; };
  in
{
  home.packages = [
    blackbox-sixel
  ];

  home.file.".local/share/blackbox/schemes/rose-pine.json".source = "${inputs.rose-pine-black-box}/schemes/rose-pine.json";

  dconf.settings = {
    "com/raggesilver/BlackBox" = {
      use-sixel = true;
      font = "Hasklug Nerd Font Mono 13";
      theme-dark = "Rosé Pine";
      style-preference = lib.hm.gvariant.mkUint32 2;
      terminal-padding = with lib.hm.gvariant; mkTuple [
        (mkUint32 8)
        (mkUint32 8)
        (mkUint32 8)
        (mkUint32 8)
      ];
      # terminal-padding = lib.hm.gvariant.mkTuple [
      #   (lib.hm.gvariant.mkUint32 8)
      #   (lib.hm.gvariant.mkUint32 8)
      #   (lib.hm.gvariant.mkUint32 8)
      #   (lib.hm.gvariant.mkUint32 8)
      # ];
    };
  };
}
