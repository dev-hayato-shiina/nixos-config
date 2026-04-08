{ inputs, pkgs, ... }:
inputs.zjstatus-hints.packages.${pkgs.stdenv.hostPlatform.system}.default
