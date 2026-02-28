{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  # Electron アプリを Wayland ネイティブで動かす
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
