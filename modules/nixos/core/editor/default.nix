{ pkgs, ... }:

{
  # システム全体で利用可能なパッケージをインストールする
  environment.systemPackages = with pkgs; [
    vim-full    # Vim（全機能版）
    wl-clipboard # Wayland向けクリップボードユーティリティ（wl-copy / wl-paste）
  ];

  # Vim をシステムレベルで有効化する
  programs.vim.enable = true;

  # Neovim をシステムレベルで有効化する
  programs.neovim = {
    enable = true;
    defaultEditor = true; # デフォルトエディタ（$EDITOR）を Neovim に設定する
    viAlias = false;      # vi コマンドを Neovim のエイリアスにしない
    vimAlias = false;     # vim コマンドを Neovim のエイリアスにしない
  };
}
