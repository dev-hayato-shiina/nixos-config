{ ... }:

{
  # Linux デスクトップ向けパッケージマネージャーを有効化する
  # アプリケーションをサンドボックス化して実行するため安全性が高い
  # NixOS が公式対応していないアプリケーションのインストールに使用する
  services.flatpak.enable = true;

  # XDG Desktop Portal を有効化する（Flatpak の動作に必要）
  # ファイル選択ダイアログ・スクリーンキャプチャなどのデスクトップ統合機能を提供する
  xdg.portal.enable = true;

  # X11 アプリケーションを Wayland 上で動作させる XWayland を有効化する
  services.xserver.enable = true;  # XWayland の基盤として必要
  programs.xwayland.enable = true; # XWayland 本体を有効化する
}
