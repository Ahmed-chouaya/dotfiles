{
  description = "Milos + Caelestia setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, caelestia-shell, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    
  in {
    homeConfigurations.ahmed =
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          caelestia-shell.homeManagerModules.default
          ./home.nix
        ];
      };
  };
}
