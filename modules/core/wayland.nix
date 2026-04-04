{ pkgs, ... }:
{
  # programs.hyprland = {
  #   enable = true;
  # };

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    # config = {
    #   common.default = [ "gtk" ];
    #   niri.default = [
    #     "gtk"
    #     "niri"
    #   ];
    # };
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
