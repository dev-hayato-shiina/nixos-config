{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # 壁紙 + ブラー
      image = "${./wallpaper/wallpaper.jpg}";
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";

      # 時計表示 (hyprlock の label に近い)
      clock = true;
      timestr = "%k:%M";
      datestr = "- %A, %B %d -";

      font = "JetBrainsMono Nerd Font Bold";
      font-size = 16;

      hide-cursor = true;
      ignore-empty-password = true;

      # カラー (Gruvbox ベース、hyprlock の設定に合わせる)
      color = "1d2021";

      # インジケーターリング
      ring-color = "a89984f2";       # outer_color
      inside-color = "665c5455";     # inner_color
      text-color = "ebdbb2e6";       # font_color

      # キー入力
      key-hl-color = "98971af2";     # check_color
      bs-hl-color = "cc241df2";

      # エラー時
      ring-wrong-color = "cc241df2"; # fail_color
      inside-wrong-color = "cc241d55";
      text-wrong-color = "ebdbb2e6";

      # 確認中
      ring-ver-color = "98971af2";
      inside-ver-color = "98971a55";
      text-ver-color = "ebdbb2e6";

      # CapsLock
      caps-lock-key-hl-color = "d79921f2"; # capslock_color
      caps-lock-bs-hl-color = "d79921f2";

      # セパレータ非表示
      line-uses-ring = true;
      separator-color = "00000000";
    };
  };
}
