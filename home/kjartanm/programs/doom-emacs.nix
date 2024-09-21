{ pkgs, inputs, ... }: {
  imports = [
    inputs.nix-doom-emacs-unstraightened.hmModule
  ];
  programs.doom-emacs = {
    enable = true;
    # emacs = pkgs.emacs29-pgtk;
    emacs = pkgs.emacs-unstable-pgtk;
    doomDir = "${inputs.nix-doom-emacs-unstraightened}/doomdir";
  };
}
