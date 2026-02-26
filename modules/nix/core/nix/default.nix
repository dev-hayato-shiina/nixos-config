{ ... }:

{
  nix.settings = {
    auto-optimise-store = true; # Nix storeの最適化
    experimental-features = [ "nix-command" "flakes" ];
  };

  # ガベージコレクションを自動実行
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # プロプライエタリなパッケージを許可する
  nixpkgs.config.allowUnfree = true;
}
