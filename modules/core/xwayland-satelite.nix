{ pkgs, ... }:
{
  # Niri で XWayland を使えるようにするには、xwayland-satelite を使用する必要がある(公式)
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  systemd.user.services.xwayland-satellite = {
    description = "Xwayland Satellite";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      Restart = "on-failure";
    };
  };
}
