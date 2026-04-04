{ pkgs, inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.alacritty.overlays.default
      inputs.niri.overlays.default
      inputs.waybar.overlays.default
      inputs.zsh.overlays.default
      inputs.nvim.overlays.default
      (
        final: prev:
        (import ./../../pkgs {
          inherit inputs;
          inherit pkgs;
          inherit (prev) system;
        })
      )
    ];
  };
}
