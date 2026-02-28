{ pkgs, ... }:

{
  # ターミナルマルチプレクサ Zellij を有効化する
  programs.zellij = {
    enable = true;
    enableZshIntegration = true; # zsh 起動時に Zellij を自動起動するインテグレーションを有効化する
  };

  # Zellij の設定ファイルを同ディレクトリのファイルから ~/.config/zellij/ に配置する
  xdg.configFile."zellij/config.kdl" = {
    force = true; # すでにファイルが存在する場合でも上書きする
    source = ./config.kdl;
  };
}
