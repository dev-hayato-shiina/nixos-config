{ pkgs, ... }:

{
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/top-level/linux-kernels.nix

  # linux_default
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_default;

  # linux_latest
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_latest;

  # linux_zen
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
