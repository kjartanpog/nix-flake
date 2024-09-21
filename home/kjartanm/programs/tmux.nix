{ pkgs, ... }: {
  home.packages = [ pkgs.tmux ];
  # programs.tmux = {
  #   enable = true;
  #   prefix = "C-w";
  #   baseIndex = 1;
  #   keyMode = "vi";
  #   mouse = true;
  # };
}
