{ inputs, ... }: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    theme = builtins.fromTOML (builtins.readFile "${inputs.rose-pine-yazi}/theme.toml");
  };
}
