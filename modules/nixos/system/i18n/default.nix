{ pkgs, ... }:

{
  # 入力メソッドフレームワークに Fcitx5 を使用する
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      # Wayland ネイティブの入力プロトコル（text-input-v3）を使用する
      waylandFrontend = true;

      addons = with pkgs; [
        fcitx5-mozc  # Google 製の日本語入力エンジン Mozc を追加する
        fcitx5-gtk   # GTK アプリケーションとの統合サポートを追加する
      ];
    };
  };

  # アプリケーションが入力メソッドとして Fcitx5 を使用するよう環境変数を設定する
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx"; # GTK アプリケーション向け
    QT_IM_MODULE  = "fcitx"; # Qt アプリケーション向け
    XMODIFIERS    = "@im=fcitx"; # X11 アプリケーション向け
  };
}
