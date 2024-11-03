
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-unstable-pgtk
    ripgrep
    fd
    clang
  ];
}
