{ pkgs, ... }:
{
  # programs.hyprland = {
  #   enable = true;
  # };

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      niri.default = [
        "gtk"
        "niri"
      ];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.displayManager = {
    gdm.enable = true;
    defaultSession = "niri";
    sessionPackages = [
      (
        (pkgs.writeTextDir "share/wayland-sessions/niri.desktop" ''
          [Desktop Entry]
          Name=Niri
          Exec=niri
          Type=Application
        '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "niri" ];
        })
      )
    ];
  };

  # Electron アプリを Wayland ネイティブで動かす
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
