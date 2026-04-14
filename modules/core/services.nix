{ ... }:
{
  services = {
    # SSH サーバー(OpenSSH)を有効化
    openssh = {
      enable = true;

      # パスワード認証を無効化して公開鍵認証のみを許可
      settings.PasswordAuthentication = false;

      # root ユーザーによる SSH ログインを禁止
      settings.PermitRootLogin = "no";

      # SSH 接続に 2222 番ポートを使用
      ports = [ 2222 ];
    };

    gvfs.enable = true;

    gnome.gnome-keyring.enable = true;

    fstrim.enable = true;
    fwupd.enable = true;

    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      HandlePowerKey = "ignore";

      # ノートを閉じたとき → サスペンド (swayidle の before-sleep で swaylock が起動する)
      HandleLidSwitch = "suspend";

      # ignore lid close when docked/external monitor connected
      HandleLidSwitchDocked = "ignore";
    };

    udisks2.enable = true;
  };
}
