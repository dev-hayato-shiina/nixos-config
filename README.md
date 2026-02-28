# nixos-config

```sh
bw login
bw sync
bw get item 64fd7767-a8ba-4ffb-9c74-b3ff002fca2a | jq -r '.fields[] | select(.name == "agate") | .value'
```

```sh
sudo nixos-rebuild switch --flake /etc/nixos#agate
```

## Debug

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
