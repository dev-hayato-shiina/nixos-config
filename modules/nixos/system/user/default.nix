{ pkgs, config, allUsers, ... }:

{
  users.users = builtins.mapAttrs (name: user: {
    isNormalUser       = true;
    home               = user.homeDirectory;
    extraGroups        = user.extraGroups;
    hashedPasswordFile = config.sops.secrets.${user.sopsSecretKey}.path;
    shell              = pkgs.${user.shell};
    description        = user.description;
  }) allUsers;

  myModules.sops = {
    enable      = true;
    keyFile     = "/var/lib/sops/age/keys.txt";
    secretsFile = ./../../../../secrets/secrets.yaml;
    secrets = builtins.listToAttrs (map (name: {
      name  = allUsers.${name}.sopsSecretKey;
      value = { neededForUsers = true; };
    }) (builtins.attrNames allUsers));
  };
}
