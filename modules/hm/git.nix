{ config, ... }:
{
  # Git 基本設定
  programs.git = {
    enable = true;
    settings = {
      user.name = "dev-hayato-shiina"; # コミット時に使用するユーザー名
      user.email = "dev.hayato.shiina@gmail.com"; # コミット時に使用するメールアドレス
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "dev-hayato-shiina" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/dev-hayato-shiina-key";
        extraOptions = {
          TCPKeepAlive = "yes";
          IdentitiesOnly = "yes";
        };
      };
      "sheena-develop" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/sheena-develop-key";
        extraOptions = {
          TCPKeepAlive = "yes";
          IdentitiesOnly = "yes";
        };
      };
    };
  };

  home.file = {
    ".ssh/dev-hayato-shiina-key.pub" = {
      source = ./../../ssh/dev-hayato-shiina-key.pub;
    };
    ".ssh/sheena-develop-key.pub" = {
      source = ./../../ssh/sheena-develop-key.pub;
    };
    ".ssh/ssh-hayato-shiina.pub" = {
      source = ./../../ssh/ssh-hayato-shiina.pub;
    };
    ".ssh/authorized_keys" = {
      source = ./../../ssh/authorized_keys;
    };
  };
}
