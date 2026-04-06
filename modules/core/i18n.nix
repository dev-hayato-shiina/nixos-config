{ pkgs, ... }:
{
  # システムのデフォルトロケールを日本語UTF-8に設定する
  i18n.defaultLocale = "ja_JP.UTF-8";

  # カテゴリごとのロケールを個別に日本語UTF-8に設定する
  i18n.extraLocaleSettings = {
    LC_CTYPE = "ja_JP.UTF-8"; # 文字の分類・変換
    LC_ADDRESS = "ja_JP.UTF-8"; # 住所フォーマット
    LC_MEASUREMENT = "ja_JP.UTF-8"; # 単位系（メートル法など）
    LC_MESSAGES = "ja_JP.UTF-8"; # アプリケーションのメッセージ言語
    LC_MONETARY = "ja_JP.UTF-8"; # 通貨フォーマット
    LC_NAME = "ja_JP.UTF-8"; # 人名フォーマット
    LC_NUMERIC = "ja_JP.UTF-8"; # 数値フォーマット
    LC_PAPER = "ja_JP.UTF-8"; # 用紙サイズ（A4など）
    LC_TELEPHONE = "ja_JP.UTF-8"; # 電話番号フォーマット
    LC_TIME = "ja_JP.UTF-8"; # 日付・時刻フォーマット
    LC_COLLATE = "ja_JP.UTF-8"; # 文字列のソート順
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };

  # waylandFrontend = true の場合 NixOS モジュールは GTK_IM_MODULE 等を設定しないため手動設定
  # DISPLAY=:1 は xwayland-satellite が使用する display 番号
  # fcitx5 の xcb addon が XWayland に接続するために必要
  environment.sessionVariables = {
    XMODIFIERS = "@im=fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    DISPLAY = ":1";
  };
}
