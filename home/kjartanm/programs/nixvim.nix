{ inputs, ... }: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.rose-pine.enable = true;
    plugins.lsp.servers.nixd.enable = true;
  };
}
