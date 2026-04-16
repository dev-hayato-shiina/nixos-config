{ pkgs, inputs, username, ... }:
{
  programs.niri = {
    enable = true;
    # wip/branch 自身の flake.nix でビルドされたパッケージを使用
    # (PR #3483 blur がマージされたらこの行を削除する)
    package = inputs.niri-wip.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  services.displayManager.gdm.enable = false;
  # 自動ログイン → niri 起動 → hyprlock (spawn-at-startup) の順に動く
  services.greetd = {
    enable = true;
    settings.default_session = {
      # stdout/stderr を捨てて起動時の非推奨警告を画面に表示させない
      # (niri-session が systemctl --user import-environment を引数なしで呼ぶため)
      # ログは journalctl -b で確認可能
      command = "bash -c 'exec niri-session >/dev/null 2>&1'";
      user = username;
    };
  };
  # Electron アプリを Wayland ネイティブで動かす
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
