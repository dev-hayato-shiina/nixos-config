{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/top-level/linux-kernels.nix
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;

    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelModules = [ "hid-nintendo" ];
    # supportedFilesystems = [ "ntfs" ];
  };
}
