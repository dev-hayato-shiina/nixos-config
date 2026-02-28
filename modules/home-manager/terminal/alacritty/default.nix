{ config, pkgs, ... }:

{
  # ターミナルエミュレータ Alacritty の設定
  # 設定オプションの詳細は https://alacritty.org/config-alacritty.html を参照
  programs.alacritty = {
    enable = true;
    settings = {
      # 起動時に zsh 経由で Zellij（ターミナルマルチプレクサ）を自動起動する
      terminal.shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "-c" "zellij" ];
      };

      window = {
        decorations = "None";    # タイトルバーやボーダーなどのウィンドウ装飾を非表示にする
        dynamic_padding = true;  # ウィンドウサイズに応じてパディングを動的に調整する
        padding = {
          x = 5; # 左右の内側余白（px）
          y = 5; # 上下の内側余白（px）
        };
        opacity = 0.85; # ウィンドウの不透明度（0.0: 完全透明 〜 1.0: 完全不透明）
      };

      font = {
        size = 12;                                  # フォントサイズ（pt）
        normal.family = "JetBrainsMono Nerd Font";  # 使用するフォント
      };

      # カラーテーマ（Tokyo Night Moon ベース）
      colors = {
        primary = {
          background = "#222436"; # 背景色
          foreground = "#c8d3f5"; # 前景色（通常テキスト）
        };
        normal = {
          black   = "#1b1d2b"; # 黒
          red     = "#ff757f"; # 赤
          green   = "#c3e88d"; # 緑
          yellow  = "#ffc777"; # 黄
          blue    = "#82aaff"; # 青
          magenta = "#c099ff"; # マゼンタ
          cyan    = "#86e1fc"; # シアン
          white   = "#828bb8"; # 白
        };
      };
    };
  };
}
