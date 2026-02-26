{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    # https://alacritty.org/config-alacritty.html
    settings = {
      terminal.shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "-c" "zellij" ];
      };

      window = {
        decorations = "None";
        dynamic_padding = true;
        padding = {
          x = 5;
          y = 5;
        };
        opacity = 0.85;
      };

      font = {
        size = 12;
        normal.family = "JetBrainsMono Nerd Font";
      };

      colors = {
        primary = {
          background = "#222436";
          foreground = "#c8d3f5";
        };

        normal = {
          black = "#1b1d2b";
          red = "#ff757f";
          green = "#c3e88d";
          yellow = "#ffc777";
          blue = "#82aaff";
          magenta = "#c099ff";
          cyan = "#86e1fc";
          white = "#828bb8";
        };

      };
    };
  };
}
