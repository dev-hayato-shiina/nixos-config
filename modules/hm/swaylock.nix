{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      disable-caps-lock-text = true;
      ignore-empty-password = true;
      font = "JetBrainsMono Nerd Font Bold";
      clock = true;
      timestr = "%H:%M:%S";
      datestr = "%Y/%-m/%-d(%a)";
      image = "/home/hayato-shiina/wallpaper.jpg";
      fade-in = 0.2;
      effect-blur = "20x2";
      effect-scale = 0.3;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 2;
      indicator-idle-visible = true;
      color = "303446";
      key-hl-color = "32a0fa";
      bs-hl-color = "f2d5cf";
      separator-color = "00000000";
      inside-color = "303446";
      inside-clear-color = "303446";
      inside-ver-color = "303446";
      inside-wrong-color = "303446";
      ring-color = "414559";
      ring-clear-color = "f2d5cf";
      ring-ver-color = "32a0fa";
      ring-wrong-color = "ea999c";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      text-color = "c6d0f5";
      text-clear-color = "f2d5cf";
      text-ver-color = "32a0fa";
      text-wrong-color = "ea999c";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "c6d0f5";
    };
  };
}
