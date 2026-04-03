{ config, lib, ... }:
let
  cfg = config.myModules.sops;
in
{
  options.myModules.sops = {
    enable = lib.mkEnableOption "sops-nix secrets management";
    keyFile = lib.mkOption {
      type = lib.types.str;
    };
    secretsFile = lib.mkOption {
      type = lib.types.path;
    };
    secrets = lib.mkOption {
      type = lib.types.attrsOf (lib.types.attrsOf lib.types.anything);
      default = {};
    };
  };

  config = lib.mkIf cfg.enable {
    sops = {
      defaultSopsFile = cfg.secretsFile;
      defaultSopsFormat = "yaml";
      age.keyFile = cfg.keyFile;
    };
    sops.secrets = lib.mkMerge [
      cfg.secrets
    ];
  };
}
