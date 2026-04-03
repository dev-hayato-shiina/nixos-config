{ ... }:
{
  # X11(GUI)のキーボードレイアウトを日本語配列に設定する
  services = {
    xserver = {
      enable = true;
      xkb.layout = "jp";
    };
    # displayManager.autoLogin = {
    #   enable = true;
    #   user = "${username}";
    # };
    # libinput = {
    #   enable = true;
    # };
  };
  # To prevent getting stuck at shutdown
  # systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
