{ ... }:
{
  security = {
    # リアルタイム優先度のスケジューリングを非 root ユーザーに許可する
    # PipeWire の低レイテンシ処理に必要
    rtkit.enable = true;
    sudo.enable = true;
    # swaylock でパスワード認証時に GNOME Keyring を自動解除
    # (greetd は自動ログインのため PAM でパスワードが渡されず、swaylock が実質的な認証点)
    pam.services.swaylock.enableGnomeKeyring = true;
  };
}
