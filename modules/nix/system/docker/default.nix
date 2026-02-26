{ ... }:

{
  virtualisation.docker = {
    enable = true;

    # Dockerをrootlessで有効化
    rootless = {
      enable = true;
      setSocketVariable = true; # $DOCKER_HOSTを設定
    };
  };
}
