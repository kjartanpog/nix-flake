{ pkgs, inputs, ... }:
  let
    emacs-icon = pkgs.fetchurl {
      url = "https://www.svgrepo.com/show/353696/emacs.svg";
      hash = "sha256-wE3KKenld0N/amoEUOdN5NXETXD3XQnjlipHb4y+Fpc=";
    };
  in
{
  # services.emacs = {
  #   enable = true;
  #   client.enable = true;
  # };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      evil
      autothemer
      fzf
      nix-mode
    ];
    extraConfig = ''
      (require 'evil)
      (evil-mode 1)
      (use-package fzf
        :bind
      ;; Don't forget to set keybinds!
    :config
    (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
      fzf/executable "fzf"
      fzf/git-grep-args "-i --line-number %s"
      ;; command used for `fzf-grep-*` functions
      ;; example usage for ripgrep:
      ;; fzf/grep-command "rg --no-heading -nH"
      fzf/grep-command "grep -nrH"
      ;; If nil, the fzf buffer will appear at the top of the window
      fzf/position-bottom t
      fzf/window-height 15
    )
      )
      (use-package nix-mode
        :mode "\\.nix\\'")
      (setq-default display-line-numbers t)
      (tool-bar-mode -1)
      (add-to-list 'custom-theme-load-path "${inputs.pinerose-emacs}")
      (load-theme 'rose-pine t)
      (set-frame-font "Hasklug Nerd Font Mono-14")
    '';
  };
  # home.file.".local/share/applications/emacs.desktop".text = ''
  #   [Desktop Entry]
  #   Name=Emacs
  #   GenericName=Text Editor
  #   Comment=Edit text
  #   MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
  #   Exec=emacs %F
  #   Icon=${emacs-icon}
  #   Type=Application
  #   Terminal=false
  #   Categories=Development;TextEditor;
  #   StartupNotify=true
  #   StartupWMClass=Emacs
  # '';
}
