{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 6;
    gtk.enable = true;
  };
}
