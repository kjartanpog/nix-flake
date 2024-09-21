{ pkgs, inputs, ... }:
{
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = builtins.toFile "settings.org" (''
        #+PROPERTY: header-args:emacs-lisp :tangle yes
        #+begin_src emacs-lisp
        (add-to-list 'custom-theme-load-path "${inputs.rose-pine-doom-emacs}")
	;; (setq dashboard-startup-banner "${./emacspog.gif}")
	;; (setq dashboard-startup-banner "${./official_gnu.svg}")
	(setq dashboard-startup-banner "${./emaccers.png}")
        #+end_src

      '' + builtins.readFile ./settings.org);

      # Whether to include your config as a default init file.
      # If being bool, the value of config is used.
      # Its value can also be a derivation like this if you want to do some
      # substitution:
      #   defaultInitFile = pkgs.substituteAll {
      #     name = "default.el";
      #     src = ./emacs.el;
      #     inherit (config.xdg) configHome dataHome;
      #   };
      defaultInitFile = true;

      # Package is optional, defaults to pkgs.emacs
      package = pkgs.emacs-unstable-pgtk;

      # By default emacsWithPackagesFromUsePackage will only pull in
      # packages with `:ensure`, `:ensure t` or `:ensure <package name>`.
      # Setting `alwaysEnsure` to `true` emulates `use-package-always-ensure`
      # and pulls in all use-package references not explicitly disabled via
      # `:ensure nil` or `:disabled`.
      # Note that this is NOT recommended unless you've actually set
      # `use-package-always-ensure` to `t` in your config.
      alwaysEnsure = false;

      # For Org mode babel files, by default only code blocks with
      # `:tangle yes` are considered. Setting `alwaysTangle` to `true`
      # will include all code blocks missing the `:tangle` argument,
      # defaulting it to `yes`.
      # Note that this is NOT recommended unless you have something like
      # `#+PROPERTY: header-args:emacs-lisp :tangle yes` in your config,
      # which defaults `:tangle` to `yes`.
      alwaysTangle = true;

      # Optionally provide extra packages not in the configuration file.
      extraEmacsPackages = epkgs: with epkgs; [
        use-package
        doom-themes
        treesit-auto
      ];

      # Optionally override derivations.
      # override = final: prev: {
      #   weechat = prev.melpaPackages.weechat.overrideAttrs(old: {
      #     patches = [ ./weechat-el.patch ];
      #   });
      # };
    })
  ];

  home.file.".config/autostart/emacs.desktop".text = builtins.replaceStrings ["Exec=emacs %F\n"] ["Exec=emacs -mm\n"] (builtins.readFile "${pkgs.emacs-unstable-pgtk}/share/applications/emacs.desktop");
  home.file.".local/share/applications/emacs.desktop".text = builtins.replaceStrings ["Exec=emacs %F\n"] ["Exec=emacs -mm\n"] (builtins.readFile "${pkgs.emacs-unstable-pgtk}/share/applications/emacs.desktop");
}
