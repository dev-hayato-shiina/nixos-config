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

    "nvim/stylua.toml" = {
      force = true;
      source = "${profilePath}/stylua.toml";
    };

    "nvim/.neoconf.json" = {
      force = true;
      source = "${profilePath}/.neoconf.json";
    };

    "nvim/.gitignore" = {
      force = true;
      source = "${profilePath}/.gitignore";
    };

    "nvim/LICENSE" = {
      force = true;
      source = "${profilePath}/LICENSE";
    };

    "nvim/README.md" = {
      force = true;
      source = "${profilePath}/README.md";
    };

    "nvim/lua" = {
      force = true;
      source = "${profilePath}/lua";
    };
  };
}
