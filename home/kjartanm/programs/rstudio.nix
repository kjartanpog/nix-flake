{ pkgs, ... }:
  let
    MyRPackages = with pkgs.rPackages; [
      vitae
      tidyverse
      learnr
      shiny
      languageserver
    ];
    RStudio-with-my-packages = pkgs.rstudioWrapper.override{ packages = MyRPackages; };
    R-with-my-packages = pkgs.rWrapper.override{ packages = MyRPackages; };

    Quarto-with-my-packages = pkgs.quarto.override( prev: {
      extraRPackages = MyRPackages;
    });
  in
{
  home.packages = [
    R-with-my-packages
    RStudio-with-my-packages
    pkgs.texlive.combined.scheme-full
    pkgs.pandoc
    Quarto-with-my-packages
  ];
}
