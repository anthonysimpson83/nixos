{

	description = "My first Flake!";

	inputs = {
          
          nixpkgs.url = "nixpkgs/nixos-unstable";
	  home-manager.url = "github:nix-community/home-manager/master";
	  home-manager.inputs.nixpkgs.follows = "nixpkgs";
	  
          plugin-onedark.url = "github:navarasu/onedark.nvim";
          plugin-onedark.flake = false;

	};

	outputs = { self, nixpkgs, home-manager, ... }:
	  let
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
 	  in {
	  nixosConfigurations = {
	    Gambit = lib.nixosSystem {
	      inherit system;
	      modules = [ ./configuration.nix ];
	    };
	  };
	  homeConfigurations = {
	    tony = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
	      modules = [ ./home.nix ];
          };

        }; 
        };

}
