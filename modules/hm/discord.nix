{ ... }:
{
  # Flatpak の Discord をインストール
  # | Flatpak の Discord を X11(xwayland-satellite) で動かすための設定
  # | Wayland ネイティブ対応が不安定なため、XWayland 経由で起動する
  # | 起動エイリアスは以下に記載
  # | https://github.com/dev-hayato-shiina/nix-configs/blob/7dbdb369e6bb908a6bf96608f40fed84852eca98/zsh/module.nix#L37
  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];
}
