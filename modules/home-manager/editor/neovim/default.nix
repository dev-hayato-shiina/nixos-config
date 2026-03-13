{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    ripgrep
    lazydocker
    lazygit
    gcc
  ];
}
