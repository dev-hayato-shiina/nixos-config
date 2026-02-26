{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.totem # ビデオプレーヤー
    pkgs.evince # PDFビューアー
    parsec-bin # 超速いリモートデスクトップクライアント
    remmina # VNCクライアント
    ripgrep
  ];
}
