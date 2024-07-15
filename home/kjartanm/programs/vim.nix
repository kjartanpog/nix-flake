{ pkgs, inputs, ... }: {

  # :h ins-completion
  programs.vim = {
    enable = true;
    # extraConfig = builtins.readFile ../dotfiles/vimrc;
    extraConfig = builtins.readFile "${inputs.dotfiles-kjartanm}/vimrc";
    plugins = with pkgs.vimPlugins; [
      vim-signature
      vim-surround
      vim-commentary
      vim-fugitive
      vim-gitgutter
      vim-rose-pine
      vim-healthcheck
      vimwiki
      # vim-pandoc
      # vim-pandoc-syntax
      fzf-vim
      vim-lsp
      vim-lsp-settings
      goyo-vim
    ];
  };

  home.sessionVariables = {
    "GVIM_ENABLE_WAYLAND" = 1;
  };

  home.file.".gvimrc".source = "${inputs.dotfiles-kjartanm}/gvimrc";
  home.file.".vim/spell/".source = inputs.vim-spellfile-is;
}
