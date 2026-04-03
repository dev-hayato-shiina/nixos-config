{ ... }:
{
  # programs.hyprland = {
  #   enable = true;
  # };

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    # config = {
    #   common.default = [ "gtk" ];
    #   hyprland.default = [
    #     "gtk"
    #     "hyprland"
    #   ];
    # };

    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.displayManager = {
    gdm.enable = true;
    defaultSession = "niri";
  };

  # Electron アプリを Wayland ネイティブで動かす
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
