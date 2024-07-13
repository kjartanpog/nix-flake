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
        in
        {
          vimPlugins =
            super.vimPlugins // {
              inherit vim-rose-pine vim-healthcheck;
            };
        }
      )
    ];
  };
}
