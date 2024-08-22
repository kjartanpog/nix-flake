{ pkgs, inputs, ... }:

{
  users.users.kjartanm = {
    isNormalUser = true;
    description = "Kjartan Masson";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # Needed for xremap
  users.groups = {
    uinput.members = [ "kjartanm" ];
    input.members = [ "kjartanm" ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "kjartanm" = import ./home.nix;
    };
    useGlobalPkgs = true;
    # useUserPackages = true;
    backupFileExtension = "backup";
  };

  imports = [
    ./experimental.nix
    ./fonts.nix
  ];
}
