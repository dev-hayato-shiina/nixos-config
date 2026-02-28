{ allUsers, ... }:

let
  userVars = allUsers."hayato-shiina";
in
{
  # TODO: uses/xxx.nix の定数を元にインポートされるものが変わるようにする
  imports = [
    ./system/cursor/default.nix
    ./services/notification/default.nix
    ./wallpaper/default.nix
    ./wm/niri/default.nix
    ./wm/waybar/default.nix
    ./i18n/fcitx5/default.nix
    ./terminal/alacritty/default.nix
    ./terminal/zellij/default.nix
    ./shell/zsh/default.nix
    ./editor/neovim/default.nix
    ./editor/vim/default.nix
    # ./app/core.nix
    ./app/bitwarden.nix
    # ./app/firefox.nix
    ./app/chrome.nix
    ./tool/git.nix
  ];

  home = rec {
    username = userVars.username;
    homeDirectory = userVars.homeDirectory;
    stateVersion = userVars.stateVersion;
  };

  programs.home-manager.enable = true;
}
