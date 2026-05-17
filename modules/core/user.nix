{
  config,
  pkgs,
  host,
  inputs,
  username,
  ...
}:
let
  ageKeyFile = "/var/lib/sops/age/keys.txt";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./sops.nix
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../hm ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "26.05";
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };
  # ユーザー管理を NixOS の宣言的設定のみに限定
  # | true(デフォルト) の場合、passwdコマンド等による命令的な変更が可能だが
  # | false にすることで設定ファイル外からのユーザー変更を禁止し、冪等性を保証する
  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."hayato_shiina_hashed_password".path;
  };
  nix.settings.allowed-users = [ "${username}" ];
  myModules.sops = {
    enable = true;
    keyFile = ageKeyFile;
    secretsFile = ./../../secrets/secrets.yaml;
    secrets = {
      hayato_shiina_hashed_password = {
        neededForUsers = true;
      };
    };
  };
}
