{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    # Flatpak アプリ (Discord など) が org.freedesktop.portal.Notification 経由で
    # 通知を送れるようにするためのバックエンド
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    # Niri は非標準コンポジターのため、全インターフェースを利用可能な実装に委ねる
    config.common.default = "*";
  };
}
