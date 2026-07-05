{ ... }:
{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    # ./hardware.nix
    ./i18n.nix
    ./libvirt.nix
    ./network.nix
    ./niri.nix
    # ./nixpkgs.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sops.nix
    ./system.nix
    ./user.nix
    ./virtualbox.nix
    ./wayland.nix
    ./xwayland-satelite.nix
  ];
}
