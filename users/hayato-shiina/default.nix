{
  username           = "hayato-shiina";
  homeDirectory      = "/home/hayato-shiina";
  stateVersion       = "25.11";
  neovimProfile      = "full"; # minimal
  extraGroups        = [ "wheel" "docker" ];
  description        = "Hayato Shiina";
  shell              = "zsh";
  sopsSecretKey      = "hayato_shiina_hashed_password";
}
