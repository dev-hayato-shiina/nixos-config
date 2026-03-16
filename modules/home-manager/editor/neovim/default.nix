{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    ripgrep
    lazydocker
    lazygit
    gcc
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      lua-language-server
    ];
  };
}
