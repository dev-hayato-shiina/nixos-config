# nixos-config

## Host Name

- agate/ アゲート
- beryl/ ベリル
- citrine/ シトリン
- dravite/ ドラバイト
- emerald/ エメラルド
- ferberite/ フェブライト
- garnet/ ガーネット
- halite/ ハーライト
- iolite/ アイオライト
- kyanite/ カイヤナイト
- lazurite/ ラズライト
- malachite/ マカライト
- opal/ オパール
- peridot/ ペリドット
- rutile/ ルチル
- sapphire/ サファイア
- topaz/ トパーズ
- uvite/ ウバイト
- vivianite/ ビビアナイト
- wernerrite/ ウェルネライト
- yooperlite/ ユーパーライト
- zrcon/ ジルコン

## Wallpaper

https://github.com/ryan4yin/wallpapers/tree/main

## Commands

- copy.sh
```sh
sh copy.sh
```

- add_user_password.sh
```sh
sh add_user_password.sh
```

- setup_ssh_key.sh
```sh
sh setup_ssh_key.sh
```

- Bitwarden CLI
```sh
bw login
bw sync
bw get item 64fd7767-a8ba-4ffb-9c74-b3ff002fca2a | jq -r '.fields[] | select(.name == "agate") | .value'
```

- NixOS Rebuid（エイリアス設定済み）
```sh
rebuild
```

- NixOSのガベージコレクションを削除
```sh
sudo nix-collect-garbage -d
```

## nix develop

```sh
nix develop .#node
```

```sh
nix develop .#deno
```

## nix shell

```sh
nix shell nixpkgs#tree
```

## NixOS Debug

```sh
cd /etc/nixos && nix repl
```

```sh
nix-repl> :lf /etc/nixos
```

全展開されて表示される
```sh
nix-repl> :p nixosConfigurations
```

- `Ctrl + l` でクリアできる

## NixOS Packages

https://search.nixos.org/packages?channel=25.11

## NixOS Options

https://search.nixos.org/options?channel=25.11

## Home Manager Option SEARCH

https://home-manager-options.extranix.com/

## Neovim Plugins

https://github.com/rockerBOO/awesome-neovim

## Neovim Debug

- Neovim起動時のエラーメッセージを保存
```sh
nvim --headless -c 'messages' -c 'qa!' > ~/neovim-error.txt 2>&1
```
