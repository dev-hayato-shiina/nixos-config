{ pkgs, ... }:

{
  # Wayland 向け通知デーモン Mako を有効化する
  # notify-send コマンドで通知を送信できるようになる
  # Home Manager によって自動起動するよう設定される
  services.mako = {
    enable = true;
    settings = {
      background-color = "#05366ecc"; # 背景色（末尾 cc は透明度）
      border-color = "#7aa2f7aa";     # ボーダー色（末尾 aa は透明度）
      border-radius = 10;             # ボーダーの角丸サイズ（px）
      border-size = 1;                # ボーダーの太さ（px）
      text-color = "#c0caf5";         # テキスト色
      padding = "10,20";              # 内側の余白（上下 10px, 左右 20px）
      font = "JetBrainsMono Nerd Font 10"; # フォントとサイズ
      default-timeout = 5000;         # 通知が自動で消えるまでの時間（ms）
      format = "🔔 <b>%s</b>\n%b";   # 通知の表示フォーマット（%s: タイトル, %b: 本文）

      # アプリ側が通知にアクションボタン（例: 「開く」「閉じる」）を付けて送ってきた場合に
      # それを表示して操作できるようにする（対応していないアプリの通知には影響しない）
      actions = true;
    };
  };
}
