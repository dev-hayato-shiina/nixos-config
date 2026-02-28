{ config, lib, pkgs, allUsers, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];

  networking.hostName = "agate";
  system.stateVersion = "25.11";
}
