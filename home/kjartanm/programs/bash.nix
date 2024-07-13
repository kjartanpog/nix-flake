{ inputs, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh
    '' + builtins.readFile "${inputs.dotfiles-kjartanm}/bashrc";
  };

  programs.readline = {
    enable = true;
    extraConfig = builtins.readFile "${inputs.dotfiles-kjartanm}/inputrc";
  };
}

