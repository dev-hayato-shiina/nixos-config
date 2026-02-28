{ pkgs, ... }:

{
  # Git の基本設定を行う
  programs.git = {
    enable = true;
    settings = {
      user.name = "dev-hayato-shiina";            # コミット時に使用するユーザー名
      user.email = "dev.hayato.shiina@gmail.com"; # コミット時に使用するメールアドレス
    };
  };
}
