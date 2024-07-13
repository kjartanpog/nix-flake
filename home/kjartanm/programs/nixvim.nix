{ inputs, pkgs, ... }: {

  home.packages = with pkgs; [
    neovim-gtk
  ];

  programs.nixvim = {
    enable = true;
  };
}
