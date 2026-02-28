{ lib, pkgs, allUsers, ... }:

let
  # TODO: uses/xxx.nix の定数を元にインポートされるものが変わるようにする
  userVars = allUsers."hayato-shiina";

  # 使用するプロファイルのディレクトリパス（full / minimal）
  profilePath = ./profiles/${userVars.neovimProfile};
in
{
  imports = [ "${profilePath}/package.nix" ];

  xdg.configFile = {
    "nvim/init.lua" = {
      force = true;
      source = "${profilePath}/init.lua";
    };

    "nvim/lua" = {
      force = true;
      source = "${profilePath}/lua";
    };
  };
}
