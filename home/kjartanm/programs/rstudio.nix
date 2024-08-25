{ pkgs, ... }:
  let
    RStudio-with-my-packages = with pkgs; rstudioWrapper.override{
      packages = with rPackages; [
        ggplot2
        dplyr
        xts
        vitae
        tidyverse
      ];
    };
  in
{
  home.packages = [
    RStudio-with-my-packages
    pkgs.texlive.combined.scheme-full
    pkgs.pandoc
  ];
}
