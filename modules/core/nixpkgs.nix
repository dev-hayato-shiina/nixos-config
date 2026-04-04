{ pkgs, inputs, ... }:
{
  nixpkgs = {
    overlays = [
      (final: prev: {
        zsh = inputs.zsh.wrappers.default.wrap {
          pkgs = final // {
            zsh = prev.zsh;
          };
        };
      })
      (final: prev: {
        alacritty = inputs.alacritty.wrappers.default.wrap {
          pkgs = final // {
            alacritty = prev.alacritty;
          };
        };
      })
      (final: prev: {
        niri = inputs.niri.wrappers.default.wrap {
          pkgs = final // {
            niri = prev.niri;
          };
        };
      })
      (final: prev: {
        waybar = inputs.waybar.wrappers.default.wrap {
          pkgs = final // {
            waybar = prev.waybar;
          };
        };
      })
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
