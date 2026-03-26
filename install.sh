#!/usr/bin/env bash

# Rootユーザーに切り替える
# sudo -i

# キーボードのレイアウトをjp106に変更する
# loadkeys jp106

# curl -O https://raw.githubusercontent.com/dev-hayato-shiina/nixos-config/main/install.sh

# ディスク領域を確認する
lsblk -l

# SSDのパーティション作成
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart root ext4 512MB -8GB
parted /dev/nvme0n1 -- mkpart swap linux-swap -8GB 100%
parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
parted /dev/nvme0n1 -- set 3 esp on

# HDDのパーティション作成 (1TB丸ごとhome用)
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart home ext4 1MB 100%

# 確認
lsblk -l

# SSDフォーマット
mkfs.ext4 -L nixos /dev/nvme0n1p1
mkswap -L swap /dev/nvme0n1p2
mkfs.fat -F 32 -n boot /dev/nvme0n1p3

# HDDフォーマット
mkfs.ext4 -L home /dev/sda1

# マウント
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mkdir -p /mnt/home
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
mount /dev/disk/by-label/home /mnt/home
swapon /dev/disk/by-label/swap

# configuration.nixの生成
nixos-generate-config --root /mnt

rm /mnt/etc/nixos/configuration.nix
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/
git clone https://github.com/dev-hayato-shiina/nixos-config.git /mnt/etc/nixos/.
rm /mnt/etc/nixos/hosts/agate/hardware-configuration.nix
mv /mnt/etc/hardware-configuration.nix /mnt/etc/nixos/hosts/agate/

# keys.txtの作成・編集（保存して閉じたら次へ進む）
mkdir -p /mnt/var/lib/sops/age
touch /mnt/var/lib/sops/age/keys.txt
vim /mnt/var/lib/sops/age/keys.txt

# flakeを使ってインストール
nixos-install --flake .#agate

# シャットダウン
shutdown -h now