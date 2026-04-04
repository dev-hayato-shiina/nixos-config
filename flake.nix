{
  description = "dev-hayato-shiina's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    sops-nix.url = "github:Mic92/sops-nix";
    zjstatus.url = "github:dj95/zjstatus";
    # alacritty = {
    #   url = "github:dev-hayato-shiina/nix-configs?dir=alacritty";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nvim = {
      url = "github:dev-hayato-shiina/nix-configs?dir=neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # niri = {
    #   url = "github:dev-hayato-shiina/nix-configs?dir=niri";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # waybar = {
    #   url = "github:dev-hayato-shiina/nix-configs?dir=waybar";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # zsh = {
    #   url = "github:dev-hayato-shiina/nix-configs?dir=zsh";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      username = "hayato-shiina";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        # nixpkgs のプロプライエタリ(unfree)ライセンスのパッケージのインストールを許可
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        agate = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/agate
            inputs.sops-nix.nixosModules.sops
            # inputs.alacritty.nixosModules.default
            inputs.nvim.nixosModules.default
            # inputs.niri.nixosModules.default
            # inputs.waybar.nixosModules.default
            # inputs.zsh.nixosModules.default
          ];
          specialArgs = {
            host = "agate";
            inherit self inputs username;
          };
        };
      };
    };
}
