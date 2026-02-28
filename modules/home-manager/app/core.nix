{ pkgs, ... }:

{
  home.packages = with pkgs; [
    totem      # ビデオプレーヤー
    evince     # PDF ビューアー
    parsec-bin # 超低遅延のリモートデスクトップクライアント
    remmina    # RDP / VNC クライアント
    ripgrep    # 高速なテキスト検索ツール（grep の代替）
  ];
}
