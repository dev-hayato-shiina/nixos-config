{ ... }:

{
  # Niri の設定ファイルを同ディレクトリのファイルから ~/.config/niri/ に配置する
  xdg.configFile."niri/config.kdl" = {
    force = true; # すでにファイルが存在する場合でも上書きする
    source = ./config.kdl;
  };
}
