{ pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
  ];

  # キーリング (gnome-keyring) の認証ダイアログを抑制する
  # Bitwarden でパスワード管理しているため Chrome 組み込みのキーリング連携は不要
  xdg.configFile."google-chrome-flags.conf".text = ''
    --password-store=basic
  '';
}
