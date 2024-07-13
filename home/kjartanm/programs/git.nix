{ ... }: {
  programs.git = {
    enable = true;
    userName = "kjartanpog";
    userEmail = "kjartan.masson@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
