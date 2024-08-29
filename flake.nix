{
  description = "My NixOS config & more!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    programsdb = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vim-healthcheck = {
      url = "github:rhysd/vim-healthcheck";
      flake = false;
    };

    vim-rose-pine = {
      url = "github:rose-pine/vim";
      flake = false;
    };

    nvim-r = {
      url = "github:jalvesaq/Nvim-R";
      flake = false;
    };

    quarto-vim = {
      url = "github:quarto-dev/quarto-vim";
      flake = false;
    };

    vim-spellfile-is = {
      url = "github:recette-lemon/vim-spell-is";
      flake = false;
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    thunderbird-gnome-theme = {
      url = "github:rafaelmardojai/thunderbird-gnome-theme";
      flake = false;
    };

    xremap-flake = {
      url = "github:xremap/nix-flake";
    };

    slippi-nix = {
      # url = "github:lytedev/slippi-nix";
      url = "github:kjartanpog/slippi-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles-kjartanm = {
      url = "github:kjartanpog/dotfiles";
      flake = false;
    };

    nix-gaming.url = "github:fufexan/nix-gaming";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixos-cosmic, ... }@inputs:
    let
      system = "x86_64-linux";
      nixpkgsUnfree = nixpkgs { config.allowUnfree = true; };
      pkgs = nixpkgsUnfree.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        Z13 = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
              inputs.home-manager.nixosModules.default
              # inputs.nix-gaming.nixosModules.pipewireLowLatency
              ./hosts/Z13/configuration.nix
              ./overlay.nix
              { nix.registry.nixpkgs.flake = nixpkgs; }
              {
                nix.settings = {
                  substituters = [ "https://cosmic.cachix.org/" ];
                  trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
                };
              }
              nixos-cosmic.nixosModules.default
            ];
    };
        T14 = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2
              inputs.home-manager.nixosModules.default
              ./hosts/T14/configuration.nix
              ./overlay.nix
              { nix.registry.nixpkgs.flake = nixpkgs; }
            ];
        };
      };
    };
}
