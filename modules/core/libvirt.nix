{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
  users.users."hayato-shiina".extraGroups = [
    "libvirtd"
  ];
}
