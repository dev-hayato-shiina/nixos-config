{ ... }:

{
  xdg.configFile."fcitx5/profile" = {
    force = true;
    source = ./profile;
  };

  xdg.configFile."fcitx5/config" = {
    force = true;
    source = ./config;
  };
}
