{ ... }:
{
  # セッション全体に適用する環境変数を設定
  home.sessionVariables = {
    LANG = "en_US.UTF-8"; # ロケールを英語 UTF-8 に設定する(エラーメッセージを英語で表示するため)
  };

  # Powerlevel10k のプロンプト設定ファイルをホームディレクトリに配置
  home.file.".p10k.zsh" = {
    force = true;
    source = ./.p10k.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true; # Tab キーによるコマンド・パスの自動補完を有効化する
    autosuggestion.enable = true; # 履歴に基づいた入力サジェストを有効化する
    syntaxHighlighting.enable = true; # コマンドのシンタックスハイライトを有効化する

    shellAliases = {
      ".." = "cd ..";
      "...." = "cd ../..";
      "......" = "cd ../../..";
      "........" = "cd ../../../..";

      c = "clear";

      rebuild = ''sudo nixos-rebuild switch --flake "path:/etc/nixos#agate"'';

      update = "cd /etc/nixos && nix flake update";

      gc-clear = "sudo nix-collect-garbage -d";

      claude-monitor = "claude-monitor --plan pro --time-format 24h --timezone Asia/Tokyo --theme dark";

      claude-code-monitor = "claude-code-monitor --plan pro --time-format 24h --timezone Asia/Tokyo --theme dark";

      grep = "rg"; # grep を ripgrep に置き換える

      # Discord を DISPLAY=:1(xwayland-satellite 経由の X11)で起動する
      # Flatpak パーミッションの設定は modules/core/flatpak.nix を参照
      discord = "env DISPLAY=:1 TZ=Asia/Tokyo flatpak run com.discordapp.Discord --env=TZ=Asia/Tokyo";
    };

    # .zshrc の内容を同ディレクトリのファイルから読み込んで適用する
    initContent = builtins.readFile ./.zshrc;
  };
}
