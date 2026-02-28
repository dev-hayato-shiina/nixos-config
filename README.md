# nixos-config

```shell
$ bw login
$ bw sync
$ bw get item 64fd7767-a8ba-4ffb-9c74-b3ff002fca2a | jq -r '.fields[] | select(.name == "agate") | .value'
```
