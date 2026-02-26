{ ... }:

{
  imports = [
    # core
    ../modules/nix/core/nix/default.nix
    ../modules/nix/core/kernel/default.nix
    ../modules/nix/core/locale/default.nix
    ../modules/nix/core/shell/default.nix
    ../modules/nix/core/editor/default.nix
    ../modules/nix/core/user-base/default.nix

    # system
    ../modules/nix/system/boot/default.nix
    ../modules/nix/system/networking/default.nix
    ../modules/nix/system/audio/default.nix
    ../modules/nix/system/bluetooth/default.nix
    ../modules/nix/system/wm/niri/default.nix
    ../modules/nix/system/wm/niri/xwayland-satelite.nix
    ../modules/nix/system/wm/swaybg/default.nix
    ../modules/nix/system/wm/waybar/default.nix
    ../modules/nix/system/wm/wofi/default.nix
    ../modules/nix/system/i18n/default.nix
    ../modules/nix/system/font/default.nix
    ../modules/nix/system/ssh/default.nix
    ../modules/nix/system/tailscale/default.nix
    ../modules/nix/system/docker/default.nix
    ../modules/nix/system/flatpak/default.nix
    ../modules/nix/system/user/hayato-shiina.nix

    # flatpak
    ../modules/nix/flatpak/app/discord.nix
  ];
}
