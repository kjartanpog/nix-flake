{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    inter
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
  ];
}
