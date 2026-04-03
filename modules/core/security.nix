{ ... }:
{
  security = {
    # リアルタイム優先度のスケジューリングを非 root ユーザーに許可する
    # PipeWire の低レイテンシ処理に必要
    rtkit.enable = true;
    sudo.enable = true;
    pam.services = {
      swaylock = { };
      hyprlock = { };
    };
  };
}
