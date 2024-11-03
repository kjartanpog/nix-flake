{ ... }: {
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>o";
      command = "emacsclient -e '(prot-window-popup-org-capture)'";
      name = "popup org-capture";
    };
  };
}
