{ ... }:

{
  virtualisation.docker = {
    enable = true;

    # Docker をルート権限なしで実行する rootless モードを有効化する
    # コンテナの侵害時にホストへの影響を最小限に抑えられる
    rootless = {
      enable = true;

      # $DOCKER_HOST に rootless ソケットのパスを自動設定する
      setSocketVariable = true;
    };
  };
}
