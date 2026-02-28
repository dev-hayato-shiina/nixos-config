{ pkgs, ... }:

{
  # パスワードマネージャー Bitwarden のデスクトップアプリをインストールする
  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
  ];
}
