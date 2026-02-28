{ pkgs, ... }:

{
  # /run/current-system/sw/share/fonts/ にフォントを配置し、アプリから参照できるようにする
  fonts.fontDir.enable = true;

  # インストールするフォントパッケージ
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans       # Noto Sans CJK（日中韓対応ゴシック体）
    noto-fonts-cjk-serif      # Noto Serif CJK（日中韓対応明朝体）
    noto-fonts-color-emoji    # Noto Color Emoji（カラー絵文字）
    nerd-fonts.jetbrains-mono # JetBrains Mono（アイコングリフ付きプログラミング向けフォント）
  ];

  # アプリケーションがフォントを指定しない場合に使用するデフォルトフォントを設定する
  fonts.fontconfig.defaultFonts = {
    serif     = [ "Noto Serif CJK JP" "Noto Color Emoji" ]; # 明朝体
    sansSerif = [ "Noto Sans CJK JP"  "Noto Color Emoji" ]; # ゴシック体
    monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ]; # 等幅フォント
    emoji     = [ "Noto Color Emoji" ]; # 絵文字
  };
}
