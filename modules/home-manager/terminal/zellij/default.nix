{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."zellij/config.kdl" = {
    force = true;
    source = ./config.kdl;
  };
}
