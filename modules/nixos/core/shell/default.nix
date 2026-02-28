{ ... }:

{
  # zsh をシステムレベルで有効化する
  # これにより zsh が /etc/shells に登録され、ユーザーのログインシェルとして設定可能になる
  programs.zsh.enable = true;
}
