{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    lazydocker
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      ripgrep
    ];
  };
}
