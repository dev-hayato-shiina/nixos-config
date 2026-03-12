{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    lazydocker
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      ripgrep
      tree-sitter
      gcc
    ];
  };
}
