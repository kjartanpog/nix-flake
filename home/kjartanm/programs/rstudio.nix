{ pkgs, ... }:
  let
    RStudio-with-my-packages = with pkgs; rstudioWrapper.override{
      packages = with rPackages; [
        ggplot2
        dplyr
        xts
        vitae
      ];
    };
  in
{
  home.packages = [
    RStudio-with-my-packages
  ];
}
