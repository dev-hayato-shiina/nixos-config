{ pkgs, config, ... }:

{
  users.mutableUsers = false;
  users.users.hayato-shiina = {
    isNormalUser = true;
    home = "/home/hayato-shiina";
    extraGroups = [ "wheel" "docker" ];
    hashedPasswordFile = config.sops.secrets.hayato_shiina_hashed_password.path;
    shell = pkgs.zsh;
    description = "Hayato Shiina";
  };
}
