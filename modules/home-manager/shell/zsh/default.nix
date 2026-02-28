{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf     # あいまい検索ツール（履歴検索・ファイル検索など）
    ripgrep # 高速なテキスト検索ツール（grep の代替）
  ];

  # セッション全体に適用する環境変数を設定する
  home.sessionVariables = {
    # ロケールを英語 UTF-8 に設定する（エラーメッセージを英語で表示するため）
    LANG = "en_US.UTF-8";
  };

  # Powerlevel10k のプロンプト設定ファイルをホームディレクトリに配置する
  home.file.".p10k.zsh" = {
    force = true; # すでにファイルが存在する場合でも上書きする
    source = ./.p10k.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;        # Tab キーによるコマンド・パスの自動補完を有効化する
    autosuggestion.enable = true;   # 履歴に基づいた入力サジェストを有効化する
    syntaxHighlighting.enable = true; # コマンドのシンタックスハイライトを有効化する

    shellAliases = {
      # ディレクトリ移動のショートカット
      ".."       = "cd ..";
      "...."     = "cd ../..";
      "......"   = "cd ../../..";
      "........" = "cd ../../../..";

      rebuild = ''sudo nixos-rebuild switch --flake "path:/etc/nixos#$(hostname)"'';

      grep = "rg"; # grep を ripgrep に置き換える

      # Discord を DISPLAY=:1（xwayland-satellite 経由の X11）で起動する
      # Flatpak パーミッションの設定は modules/nix/flatpak/app/discord.nix を参照
      discord = "DISPLAY=:1 flatpak run com.discordapp.Discord";
    };

    # .zshrc の内容を同ディレクトリのファイルから読み込んで適用する
    initContent = builtins.readFile ./.zshrc;
  };
}
