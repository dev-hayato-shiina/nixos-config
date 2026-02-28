{ ... }:

{
  nix.settings = {
    # Nix storeの重複ファイルをハードリンクに置き換えてディスク使用量を削減する
    auto-optimise-store = true;

    # nix コマンド（新CLI）とFlakesを有効化する
    experimental-features = [ "nix-command" "flakes" ];
  };

  # ガベージコレクションを自動実行して不要なストアパスを削除する
  nix.gc = {
    automatic = true;

    # 毎週実行する
    dates = "weekly";

    # 7日以上前の世代を削除する
    options = "--delete-older-than 7d";
  };

  # nixpkgs のプロプライエタリ（unfree）ライセンスのパッケージのインストールを許可する
  nixpkgs.config.allowUnfree = true;
}
