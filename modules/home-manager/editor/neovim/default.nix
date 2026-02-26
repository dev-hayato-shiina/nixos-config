{
  config,
  pkgs,
  lib,
  neovimProfile,
  ...
}:

let
  profilePath = ./profiles/${neovimProfile};
  profilePackages = import "${profilePath}/package.nix" { inherit pkgs; };
in
{
  imports = [ profilePackages ];

  xdg.configFile."nvim/init.lua" = {
    force = true;
    source = "${profilePath}/init.lua";
  };

  xdg.configFile."nvim/lua" = {
    force = true;
    source = "${profilePath}/lua";
  };
}
