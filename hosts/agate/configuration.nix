{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../roles/desktop.nix
  ];

  networking.hostName = "agate";
  system.stateVersion = "25.11";

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/nixos/hosts/agate/keys.txt";

    secrets.hayato_shiina_hashed_password = {
      neededForUsers = true;  # ユーザー作成前に復号するために必須
    };
  };
}
