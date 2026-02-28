{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.wofi ];
}
