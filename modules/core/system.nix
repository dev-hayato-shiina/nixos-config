{ pkgs, ... }:
{
  nix = {
    settings = {
      # Nix store の重複ファイルをハードリンクに置き換えて、ディスク使用量を削減
      auto-optimise-store = true;
      # download-buffer-size = 524288000;
      # nixコマンドと Flakes を有効化
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # substituters = [
      #   "https://nix-community.cachix.org"
      #   "https://nix-gaming.cachix.org"
      #   "https://hyprland.cachix.org"
      #   "https://ghostty.cachix.org"
      # ];
      # trusted-public-keys = [
      #   "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      #   "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      #   "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      #   "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      # ];
    };
    gc = {
      # ガベージコレクションを自動実行して不要なストアパスを削除
      automatic = true;
      # 毎週実行する
      dates = "weekly";
      # 7日以上前の世代を削除
      options = "--delete-older-than 7d";
    };
  };
  # システム全体で利用可能なパッケージをインストール
  environment.systemPackages = with pkgs; [
    git
    wget
    unzip
    tree
    jq
    sops
    age
    direnv # Nix を使ってツールチェーン管理しているプロジェクトで使用
    fzf # modules/wrap/zsh.nix, modules/wrap/neovim.nix で使用
    ripgrep # modules/wrap/zsh.nix, modules/wrap/neovim.nix で使用
    eza # ls の代替
    bat # cat の代替
    fd # find の代替
    zoxide # cd の代替
    # vim-full # Vim(全機能版)
    vim
    wl-clipboard # Wayland向けクリップボードユーティリティ(wl-copy/wl-paste)
    wf-recorder
    gimp
    obs-studio
    swappy # snapshot editing tool
    zenity # GTK ファイルピッカーダイアログ
    grim
    slurp
    libnotify # notify-send コマンドを提供（Swaync への通知送信に使用）

    # helix
    # vscode.fhs

    # totem # ビデオプレーヤー
    # evince # PDF ビューアー
    # parsec-bin # 超低遅延のリモートデスクトップクライアント
    # remmina # RDP / VNC クライアント
  ];
  # タイムゾーンを日本標準時(JST, UTC+9)に設定
  time.timeZone = "Asia/Tokyo";
  # コンソール(TTY)のキーマップを106キー日本語配列に設定
  console.keyMap = "jp106";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
