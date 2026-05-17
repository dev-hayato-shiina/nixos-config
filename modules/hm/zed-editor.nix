{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zed-editor
  ];
  # programs.zed-editor = {
  #   enable = true;
  #   userSettings = {
  #     theme = {
  #       mode = "dark";
  #       dark = "One Dark";
  #       light = "One Light";
  #   };
  #   hour_format = "hour24";
  #   vim_mode = true;
  #   };
  # };
}
