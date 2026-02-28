{
  description = "NixOS";

  # ==============================================================
  # inputs: このflakeが依存する外部リポジトリを宣言する
  # ==============================================================
  inputs = {
    # Nixパッケージコレクション（unstable = 最新パッケージを使用）
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # secrets管理（APIキーやパスワードなどを暗号化してgit管理する）
    sops-nix.url = "github:Mic92/sops-nix";

    # ユーザー単位のdotfiles・パッケージ管理
    home-manager = {
      url = "github:nix-community/home-manager";

      # home-managerが参照するnixpkgsをこのflakeと同じものに固定する
      # これをしないとnixpkgsが2つ存在してビルド時間・容量が増える
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flatpakアプリをnix管理下に置くためのモジュール
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  # ==============================================================
  # outputs: このflakeが外部に公開する成果物を定義する
  # inputs から受け取った各リポジトリをここで使用する
  # ==============================================================
  outputs = { self, nixpkgs, sops-nix, home-manager, nix-flatpak }:
    let
      # ビルドターゲットのCPUアーキテクチャ
      system = "x86_64-linux";

      # ビルド対象のホスト名（hosts/ 以下のディレクトリ名と対応）
      # 切り替えたいホストのコメントを外して使う
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

      # unfreeライセンスのパッケージ（ChromeやDiscordなど）を許可したpkgsを生成
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # users/ 以下のディレクトリを自動検出してすべてのユーザー定数を読み込む
      allUsers = builtins.mapAttrs
        (name: _: import ./users/${name}/default.nix)
        (builtins.readDir ./users);
    in
    {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;

        # NixOS モジュール側に allUsers を渡す
        specialArgs = { inherit allUsers; };

        modules = [
          ./hosts/${hostName}/configuration.nix
          sops-nix.nixosModules.sops
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs    = true;
            home-manager.useUserPackages  = true;

            # HM モジュール側にも allUsers を渡す
            home-manager.extraSpecialArgs = { inherit allUsers; };

            home-manager.users = builtins.mapAttrs
              (name: _: import ./modules/home-manager/default.nix)
              allUsers;
          }
        ];
      };

      # ==============================================================
      # devShells: `nix develop` で入れる開発シェル環境
      # プロジェクトごとの開発環境をテンプレートとして定義する
      # ==============================================================
      devShells.${system} = {
        # Node.js開発環境: `nix develop .#node` で起動
        node = import ./templates/node-js/default.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };

        # Deno開発環境: `nix develop .#deno` で起動
        deno = import ./templates/deno/default.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };
      };
    };
}
