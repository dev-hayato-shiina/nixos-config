{ ... }:

{
  # SSH サーバー（OpenSSH）を有効化する
  services.openssh = {
    enable = true;

    # パスワード認証を無効化して公開鍵認証のみを許可する（セキュリティ強化）
    settings.PasswordAuthentication = false;

    # root ユーザーによる SSH ログインを禁止する
    settings.PermitRootLogin = "no";
  };
}
