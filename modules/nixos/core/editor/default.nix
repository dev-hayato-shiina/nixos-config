{ pkgs, ... }:

{
  # システム全体で利用可能なパッケージをインストールする
  environment.systemPackages = with pkgs; [
    vim-full    # Vim（全機能版）
    wl-clipboard # Wayland向けクリップボードユーティリティ（wl-copy / wl-paste）
    helix
    vscode.fhs
  ];

  # Vim をシステムレベルで有効化する
  programs.vim.enable = true;

  # Neovim をシステムレベルで有効化する
  wrappers.neovim.enable = true;

  environment.variables.EDITOR = "nvim";
}
