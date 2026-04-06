{ pkgs, inputs, ... }:
{
  programs.niri = {
    enable = true;
    # wip/branch 自身の flake.nix でビルドされたパッケージを使用
    # (PR #3483 blur がマージされたらこの行を削除する)
    package = inputs.niri-wip.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  # Electron アプリを Wayland ネイティブで動かす
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
