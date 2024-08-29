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
      vim-unimpaired
      vim-gitgutter
      vim-rose-pine
      vim-healthcheck
      vimwiki
      fzf-vim
      vim-lsp
      vim-lsp-settings
      goyo-vim
      # nvim-r
      # julia-vim
      vim-slime
      nerdtree
      vim-vinegar
    ];
  };

  home.sessionVariables = {
    "GVIM_ENABLE_WAYLAND" = 1;
  };

  home.file.".gvimrc".source = "${inputs.dotfiles-kjartanm}/gvimrc";
  home.file.".vim/spell/".source = inputs.vim-spellfile-is;
}
