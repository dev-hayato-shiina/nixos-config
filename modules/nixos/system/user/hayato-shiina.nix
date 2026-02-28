{ pkgs, config, ... }:

{
  users.users.hayato-shiina = {
    isNormalUser = true;                  # 一般ユーザーとして作成する（UID 1000番台）
    home = "/home/hayato-shiina";         # ホームディレクトリのパス
    extraGroups = [
      "wheel"   # sudo による管理者権限を付与する
      "docker"  # Docker コマンドを非 root で実行できるようにする
    ];
    # sops で管理されたハッシュ化済みパスワードファイルを参照する
    hashedPasswordFile = config.sops.secrets.hayato_shiina_hashed_password.path;
    shell = pkgs.zsh;                     # ログインシェルを zsh に設定する
    description = "Hayato Shiina";        # ユーザーの表示名
  };
}
