{ pkgs, ... }:
{
  home.packages = with pkgs; [
    flow-control
  ];
}
