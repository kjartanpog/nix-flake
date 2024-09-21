{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = {
      shell = {
        disabled = false;
        bash_indicator       = "#!";
        zsh_indicator        = "%_";
        fish_indicator       = "<º";
        nu_indicator         = "ν_";
        powershell_indicator = "_";
      };
    };
  };
}
