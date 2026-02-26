{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim-full
    wl-clipboard
  ];

  programs.vim.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = false;
    vimAlias = false;
  };
}
