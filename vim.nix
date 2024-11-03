{ pkgs, inputs, ... }: {

  # :h ins-completion
  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile "${inputs.dotfiles-kjartanm}/vimrc";
    plugins = with pkgs.vimPlugins; [
      vim-signature
      vim-surround
      vim-commentary
      vim-fugitive
      vim-unimpaired
      vim-gitgutter
      (
          pkgs.vimUtils.buildVimPlugin {
            name = "vim-rose-pine";
            src = inputs.vim-rose-pine;
          })
      vim-healthcheck
      vimwiki
      fzf-vim
      vim-lsp
      vim-lsp-settings
      goyo-vim
      limelight-vim
      vim-slime
      quarto-vim
      vim-pandoc-syntax
      asyncrun-vim
      vim-which-key
      vim-floaterm
    ];
  };

  home.sessionVariables = {
    "GVIM_ENABLE_WAYLAND" = 1;
  };

  home.file.".gvimrc".source = "${inputs.dotfiles-kjartanm}/gvimrc";
  home.file.".vim/spell/".source = inputs.vim-spellfile-is;
}
