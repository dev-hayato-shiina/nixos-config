{ pkgs, ... }:

{
  # Flatpak の Discord を X11（xwayland-satellite）で動かすための設定
  # Wayland ネイティブ対応が不安定なため、XWayland 経由で起動する
  # 起動エイリアスは modules/home-manager/shell/zsh/default.nix に記載

  # インストールする Flatpak パッケージを宣言する
  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];

  # NixOS 起動時に Discord の Flatpak パーミッションを上書きする
  # --socket=x11          : X11 ソケットへのアクセスを許可する
  # --filesystem=/tmp/.X11-unix : X11 のソケットファイルが置かれるディレクトリを共有する
  # --env=DISPLAY=:1      : xwayland-satellite が使用する DISPLAY 番号を指定する
  # || true               : すでに設定済みの場合でもエラーで止まらないようにする
  system.activationScripts.flatpakDiscordOverride = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak override --user --socket=x11 --filesystem=/tmp/.X11-unix --env=DISPLAY=:1 com.discordapp.Discord || true
    '';
    deps = [];
  };

  # discord コマンドで DISPLAY=:1（XWayland）を指定して Flatpak の Discord を起動するエイリアスを定義する
  programs.zsh.shellAliases = {
    discord = "DISPLAY=:1 flatpak run com.discordapp.Discord";
  };
}
