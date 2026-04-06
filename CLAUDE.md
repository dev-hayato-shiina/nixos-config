# NixOS Configuration (dev-hayato-shiina)

## 概要

dev-hayato-shiina の NixOS フレーク設定。ホスト名は鉱石の名前を使用。
現在のメインホスト: `agate`

## ディレクトリ構成

- `hosts/` — ホストごとの設定（agate, beryl, citrine, ...）
- `modules/core/` — システム共通モジュール
- `modules/hm/` — Home Manager モジュール
- `modules/wrap/` — ラッパーモジュール
- `pkgs/` — カスタムパッケージ
- `secrets/` — sops-nix で管理するシークレット

## 主なコマンド

```sh
# 設定を適用（エイリアス設定済み）
rebuild

# フレークのロックファイルを更新
nix flake update

# ガベージコレクション
sudo nix-collect-garbage -d

# デバッグ用 REPL
cd /etc/nixos && nix repl
# :lf /etc/nixos  でフレークをロード
```

## 主な inputs

- `nixpkgs` — nixpkgs-unstable
- `home-manager`
- `sops-nix` — シークレット管理
- `nix-flatpak`
- `nvim` — github:dev-hayato-shiina/nix-configs?dir=neovim
- `zjstatus`

## 参考リンク

- NixOS Packages: https://search.nixos.org/packages?channel=25.11
- NixOS Options: https://search.nixos.org/options?channel=25.11
- Home Manager Options: https://home-manager-options.extranix.com/
