{ inputs, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh
      GIT_PS1_SHOWDIRTYSTATE=1
      GIT_PS1_SHOWUPSTREAM="auto"
    '' + builtins.readFile "${inputs.dotfiles-kjartanm}/bashrc";
  };

  programs.readline = {
    enable = true;
    extraConfig = builtins.readFile "${inputs.dotfiles-kjartanm}/inputrc";
  };
}

