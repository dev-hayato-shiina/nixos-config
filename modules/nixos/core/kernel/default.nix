{ pkgs, ... }:

{
  # 利用可能なカーネルパッケージの一覧は以下を参照
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/top-level/linux-kernels.nix

  # linux_default: NixOS が推奨する安定版カーネル
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_default;

  # linux_latest: 最新の安定版カーネル（アップデートが頻繁）
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_latest;

  # linux_zen: デスクトップ・ゲーミング向けにチューニングされたカーネル
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
