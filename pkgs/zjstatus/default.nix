{ inputs, pkgs, ... }:
inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
