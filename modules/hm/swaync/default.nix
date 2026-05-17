{ ... }:
{
  # systemd ユーザーサービス + D-Bus アクティベーションで起動
  # niri の spawn-at-startup から移行済み
  services.swaync = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./config.json);
    style = builtins.readFile ./style.css;
  };
}
