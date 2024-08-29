{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      (self: super:
        let
          vim-rose-pine = super.vimUtils.buildVimPlugin {
            name = "vim-rose-pine";
            src = inputs.vim-rose-pine;
          };
          vim-healthcheck = super.vimUtils.buildVimPlugin {
            name = "vim-healthscheck ";
            src = inputs.vim-healthcheck;
          };
          nvim-r = super.vimUtils.buildVimPlugin {
            name = "nvim-r";
            src = inputs.nvim-r;
          };
          quarto-vim = super.vimUtils.buildVimPlugin {
            name = "quarto-vim";
            src = inputs.quarto-vim;
          };
        in
        {
          vimPlugins =
            super.vimPlugins // {
              inherit vim-rose-pine vim-healthcheck nvim-r quarto-vim;
            };
        }
      )
    ];
  };
}
