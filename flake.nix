{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      home-manager,
      nix-flatpak,
    }:
    let
      system = "x86_64-linux";
      hostName = "agate";
      # hostName = "beryl";
      # hostName = "citrine";
      # hostName = "dravite";
      # hostName = "emerald";
      # hostName = "ferberite";
      # hostName = "garnet";
      # hostName = "halite";
      # hostName = "iolite";
      # hostName = "kyanite";
      # hostName = "lazurite";
      # hostName = "malachite";
      # hostName = "opal";
      # hostName = "peridot";
      # hostName = "rutile";
      # hostName = "sapphire";
      # hostName = "topaz";
      # hostName = "uvite";
      # hostName = "vivianite";
      # hostName = "wernerrite";
      # hostName = "yooperlite";
      # hostName = "zrcon";
      neovimProfile = "full";
      # neovimProfile = "minimal";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # ----------------------------
      # NixOS
      # ----------------------------
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          # ----------------------------
          # sops
          # ----------------------------
          sops-nix.nixosModules.sops

          # ----------------------------
          # host
          # ----------------------------
          ./hosts/${hostName}/configuration.nix

          # ----------------------------
          # Flatpak
          # ----------------------------
          nix-flatpak.nixosModules.nix-flatpak

          # ----------------------------
          # home-manager
          # ----------------------------
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit neovimProfile;
            };

            home-manager.users.hayato-shiina = import ./users/hayato-shiina/home.nix;
          }
        ];
      };

      # ----------------------------
      # devShell
      # ----------------------------
      devShells.${system} = {
        node = import ./templates/node-js/default.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };

        deno = import ./templates/deno/default.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };
      };
    };
}
