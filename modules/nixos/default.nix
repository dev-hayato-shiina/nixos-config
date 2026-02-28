{ allUsers, ... }:

let
  userVars = allUsers."hayato-shiina";
in
{
  # TODO: uses/xxx.nix の定数を元にインポートされるものが変わるようにする
  imports = [
    # --- core: NixOS の基本設定 ---
    ./core/nixos      # Nix デーモン・Flakes 設定
    ./core/kernel     # カーネル設定
    ./core/locale     # タイムゾーン・ロケール設定
    ./core/shell      # シェル設定
    ./core/editor     # デフォルトエディタ設定
    ./core/user-base  # ユーザーの共通ベース設定

    # --- system: システムサービス・ハードウェア設定 ---
    ./system/boot        # ブートローダー設定
    ./system/networking  # ネットワーク設定
    ./system/audio       # オーディオ設定（PipeWire など）
    ./system/bluetooth   # Bluetooth 設定
    ./system/i18n        # 入力メソッド・日本語環境設定
    ./system/font        # フォント設定
    ./system/ssh         # SSH サーバー設定
    ./system/tailscale   # Tailscale VPN 設定
    ./system/docker      # Docker 設定
    ./system/flatpak     # Flatpak 設定
    ./system/sops

    # --- system/wm: ウィンドウマネージャー・デスクトップ環境 ---
    ./system/wm/niri                        # Niri（タイリングWM）設定
    ./system/wm/niri/xwayland-satelite.nix  # XWayland サポート
    ./system/wm/swaybg                      # 壁紙設定
    ./system/wm/waybar                      # ステータスバー設定
    ./system/wm/wofi                        # アプリケーションランチャー設定

    # --- system/user: ユーザー個別設定 ---
    ./system/user

    # --- flatpak: Flatpak アプリケーション設定 ---
    ./flatpak/app/discord.nix  # Discord
  ];
}
