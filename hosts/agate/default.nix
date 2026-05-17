{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/wrap
  ];
  # powerManagement.cpuFreqGovernor = "performance";
}
