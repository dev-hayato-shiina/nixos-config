{ config, lib, pkgs, allUsers, ... }:

let
  # "hayato-shiina" → "hayato_shiina" に変換してsopsキー名を生成
  toSopsKey = name: builtins.replaceStrings ["-"] ["_"] name;
in
{
  imports = [
    # ハードウェア固有の設定（パーティション・ファイルシステム・カーネルモジュールなど）
    # `nixos-generate-config` で自動生成されるファイル。基本的に手動編集不要
    ./hardware-configuration.nix

    ./../../modules/nixos

    # sops-nix シークレット管理モジュール
    ./../../modules/nixos/system/sops
  ];

  # ネットワーク上でのホスト識別名
  networking.hostName = "agate";

  # NixOSの状態ディレクトリ（/var/lib）のフォーマットバージョン
  # 初回インストール時のバージョンから変えないのが原則
  system.stateVersion = "25.11";

  # sopsモジュールにホスト固有の値を渡す
  myModules.sops = {
    enable = true;
    keyFile = "/var/lib/sops/age/keys.txt";
    secretsFile = ./../../secrets/secrets.yaml;

    # users/ 以下の全ユーザー分の hashed_password シークレットを自動生成
    secrets = builtins.listToAttrs (map (name: {
      name  = "${toSopsKey name}_hashed_password";
      value = { neededForUsers = true; };
    }) (builtins.attrNames allUsers));
  };
}
