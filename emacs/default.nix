{
  pkgs,
  inputs,
  ...
}: let
  emacsPkg = pkgs.emacsWithPackagesFromUsePackage {
    # config = builtins.toFile "init.el" (''
    #   ;; -*- lexical-binding: t; -*-
    #   (add-to-list 'custom-theme-load-path "${inputs.rose-pine-doom-emacs}")
    #   (setq dashboard-startup-banner "${./emaccers.png}")
    #   ;; (use-package org-modern-indent
    #   ;;   :load-path "${inputs.org-modern-indent}"
    #   ;;   :config ; add late to hook
    #   ;; (add-hook 'org-mode-hook #'org-modern-indent-mode 90))
    #   ;; (require '${inputs.karthink-emacs}/lisp/setup-core.el)
    # '' + builtins.readFile ./init.el);
    config = ./init.el;
    defaultInitFile = true;
    package = pkgs.emacs-unstable-pgtk;
    alwaysTangle = true;
    extraEmacsPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
    # override = epkgs: epkgs // {
    #   org = pkgs.callPackage ./org-latex-preview.nix {
    #     # inherit (pkgs) fetchFromGitHub;
    #     inherit (epkgs) trivialBuild;
    #   };
    # };
  };
in {
  services.emacs = {
    enable = true;
    package = emacsPkg;
  };

  programs.emacs = {
    enable = true;
    package = emacsPkg;
  };

  # home.file.".config/autostart/emacs.desktop".text = builtins.replaceStrings ["Exec=emacs %F\n"] ["Exec=emacs -mm\n"] (builtins.readFile "${pkgs.emacs-unstable-pgtk}/share/applications/emacs.desktop");
  # home.file.".local/share/applications/emacs.desktop".text = builtins.replaceStrings ["Exec=emacs %F\n"] ["Exec=emacs -mm\n"] (builtins.readFile "${pkgs.emacs-unstable-pgtk}/share/applications/emacs.desktop");
  home.file.".local/share/applications/emacs-client-vterm.desktop".text = builtins.replaceStrings ["Exec=emacs %F\n" "Name=Emacs\n" "Icon=emacs\n"] ["Exec=emacsclient -c -e '(vterm)'\n" "Name=vterm\n" "Icon=${./vterm.png}\n"] (builtins.readFile "${pkgs.emacs-unstable-pgtk}/share/applications/emacs.desktop");
}
