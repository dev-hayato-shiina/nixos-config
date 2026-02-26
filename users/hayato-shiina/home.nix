{
  neovimProfile,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/home-manager/system/cursor/default.nix
    ../../modules/home-manager/services/notification/default.nix
    ../../modules/home-manager/wallpaper/default.nix
    ../../modules/home-manager/wm/niri/default.nix
    ../../modules/home-manager/wm/waybar/default.nix
    ../../modules/home-manager/i18n/fcitx5/default.nix
    ../../modules/home-manager/terminal/alacritty/default.nix
    ../../modules/home-manager/terminal/zellij/default.nix
    ../../modules/home-manager/shell/zsh/default.nix
    ../../modules/home-manager/editor/neovim/default.nix
    ../../modules/home-manager/editor/vim/default.nix
    # ../../modules/home-manager/app/core.nix
    ../../modules/home-manager/app/bitwarden.nix
    # ../../modules/home-manager/app/firefox.nix
    ../../modules/home-manager/app/chrome.nix
    ../../modules/home-manager/tool/git.nix
  ];

  home = rec {
    username = "hayato-shiina";
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
