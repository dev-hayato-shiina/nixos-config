{ pkgs, ... }:

{
  # ウェブブラウザ Google Chrome をインストールする
  home.packages = with pkgs; [
    google-chrome
  ];
}
