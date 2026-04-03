{ pkgs, ... }:

{
  # システム全体のマウスカーソルテーマを設定する
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme; # カーソルテーマを含むアイコンパッケージ
    name = "Adwaita";                  # 使用するカーソルテーマ名
    size = 5;                          # カーソルサイズ（px）
    gtk.enable = true;                 # GTK アプリケーションにも同じカーソルテーマを適用する
  };
}
