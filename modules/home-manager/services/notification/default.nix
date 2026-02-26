{ pkgs, ... }:

{
  # notify-sendを使うための通知デーモン、自動起動するように設定
  services.mako = {
    enable = true;
    settings = {
      background-color = "#05366ecc";
      border-color = "#7aa2f7aa";
      border-radius = 10;
      border-size = 1;
      text-color = "#c0caf5";
      padding = "10,20";
      font = "JetBrainsMono Nerd Font 10";
      default-timeout = 5000;
      format = "🔔 <b>%s</b>\n%b";
      actions = true; # アプリ側が通知にアクションボタン（例: 「開く」「閉じる」）を付けて送ってきた場合に、それを表示して操作できるようにする設定。対応していないアプリの通知には何も変化しない。
    };
  };

  # services.mako だけでは niri セッションで自動起動しないため
  # graphical-session.target に紐付けて自動起動させる
  # systemd.user.services.mako = {
  #   wantedBy = [ "graphical-session.target" ];
  # };
}
