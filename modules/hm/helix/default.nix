{ pkgs, ... }:
{
  home.packages = with pkgs; [
    helix
    nixd
  ];
  xdg.configFile."helix/config.toml" = {
    force = true;
    source = ./config.toml;
  };
  xdg.configFile."helix/languages.toml" = {
    force = true;
    source = ./languages.toml;
  };
}
