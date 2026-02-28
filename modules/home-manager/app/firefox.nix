{ pkgs, ... }:

{
  # ウェブブラウザ Firefox をインストールする
  home.packages = with pkgs; [
    firefox
  ];
}
