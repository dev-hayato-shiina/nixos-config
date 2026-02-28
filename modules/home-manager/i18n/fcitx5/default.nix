{ ... }:

{
  # Fcitx5 の設定ファイルを同ディレクトリのファイルから ~/.config/fcitx5/ に配置する
  # force = true: すでにファイルが存在する場合でも上書きする

  # 入力メソッドのプロファイル設定（有効な入力メソッドの一覧など）
  xdg.configFile."fcitx5/profile" = {
    force = true;
    source = ./profile;
  };

  # Fcitx5 本体の設定（ホットキーや動作設定など）
  xdg.configFile."fcitx5/config" = {
    force = true;
    source = ./config;
  };
}
