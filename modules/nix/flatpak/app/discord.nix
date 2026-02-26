{ pkgs, ... }:

{
  # FlatpakのDiscordをX11(xwayland-satellite)で動かすための設定
  # 起動エイリアスは modules/home-manager/shell/zsh/default.nix に記載
  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];

  system.activationScripts.flatpakDiscordOverride = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak override --user --socket=x11 --filesystem=/tmp/.X11-unix --env=DISPLAY=:1 com.discordapp.Discord || true
    '';
    deps = [];
  };

  programs.zsh.shellAliases = {
    discord = "DISPLAY=:1 flatpak run com.discordapp.Discord";
  };
}
