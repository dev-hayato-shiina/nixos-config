{ ... }:
{
  services.swayidle = {
    enable = true;
    # -w: アイドルイベント処理後、suspend前にコマンド完了を待つ
    extraArgs = [ "-w" ];
    timeouts = [
      # 5分操作なし → ロック
      { timeout = 300; command = "swaylock -f"; }
      # 10分操作なし → サスペンド
      { timeout = 600; command = "systemctl suspend"; }
    ];
    events = {
      # サスペンド直前にロック (ノート閉じたとき含む)
      before-sleep = "swaylock -f";
      # loginctl lock-session で手動ロックしたとき
      lock = "swaylock -f";
    };
  };
}
