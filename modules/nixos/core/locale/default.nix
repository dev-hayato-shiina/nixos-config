{ ... }:

{
  # タイムゾーンを日本標準時（JST, UTC+9）に設定する
  time.timeZone = "Asia/Tokyo";

  # システムのデフォルトロケールを日本語UTF-8に設定する
  i18n.defaultLocale = "ja_JP.UTF-8";

  # カテゴリごとのロケールを個別に日本語UTF-8に設定する
  i18n.extraLocaleSettings = {
    LC_CTYPE     = "ja_JP.UTF-8"; # 文字の分類・変換
    LC_ADDRESS   = "ja_JP.UTF-8"; # 住所フォーマット
    LC_MEASUREMENT = "ja_JP.UTF-8"; # 単位系（メートル法など）
    LC_MESSAGES  = "ja_JP.UTF-8"; # アプリケーションのメッセージ言語
    LC_MONETARY  = "ja_JP.UTF-8"; # 通貨フォーマット
    LC_NAME      = "ja_JP.UTF-8"; # 人名フォーマット
    LC_NUMERIC   = "ja_JP.UTF-8"; # 数値フォーマット
    LC_PAPER     = "ja_JP.UTF-8"; # 用紙サイズ（A4など）
    LC_TELEPHONE = "ja_JP.UTF-8"; # 電話番号フォーマット
    LC_TIME      = "ja_JP.UTF-8"; # 日付・時刻フォーマット
    LC_COLLATE   = "ja_JP.UTF-8"; # 文字列のソート順
  };

  # X11（GUI）のキーボードレイアウトを日本語配列に設定する
  services.xserver.xkb.layout = "jp";

  # コンソール（TTY）のキーマップを106キー日本語配列に設定する
  console.keyMap = "jp106";
}
