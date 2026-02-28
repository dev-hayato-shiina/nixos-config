{ config, lib, ... }:

let
  cfg = config.myModules.sops;
in
{
  # ==============================================================
  # オプション定義: ホスト側から値を注入できるようにする
  # ==============================================================
  options.myModules.sops = {
    enable = lib.mkEnableOption "sops-nix secrets management";

    # AGEキーファイルのパス（ホストごとに異なる）
    keyFile = lib.mkOption {
      type = lib.types.str;
      description = "AGEキーファイルの絶対パス";
    };

    # 復号対象のsopsファイルのパス（ホストごとに異なる）
    secretsFile = lib.mkOption {
      type = lib.types.path;
      description = "secrets.yaml のパス";
    };

    # ホストごとに必要なsecretsを追加定義できるようにする
    # 例: { hayato_shiina_hashed_password = { neededForUsers = true; }; }
    secrets = lib.mkOption {
      type = lib.types.attrsOf (lib.types.attrsOf lib.types.anything);
      default = {};
      description = "sops.secrets に追加するエントリー";
    };
  };

  # ==============================================================
  # 実装: オプションの値を使って sops の設定を組み立てる
  # ==============================================================
  config = lib.mkIf cfg.enable {
    sops = {
      # 復号対象の sops ファイルのパス
      defaultSopsFile = cfg.secretsFile;
      defaultSopsFormat = "yaml";

      # 復号に使用する AGE キーファイルのパス
      age.keyFile = cfg.keyFile;

      # ホスト側から注入された secrets を展開する
      secrets = cfg.secrets;
    };
  };
}
