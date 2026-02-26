{ ... }:

{
  # Linuxデスクトップ向けのパッケージマネージャ
  # アプリケーションをサンドボックス化して実行する
  # NixOSが対応していないアプリのインストールに使う
  services.flatpak.enable = true;
  xdg.portal.enable = true; # flatpakに必要

  # XWayland対応
  services.xserver.enable = true;
  programs.xwayland.enable = true;
}
