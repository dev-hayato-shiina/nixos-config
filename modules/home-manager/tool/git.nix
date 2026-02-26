{pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "dev-hayato-shiina";
      user.email = "dev.hayato.shiina@gmail.com";
    };
  };

  # GitHub CLI
  # programs.gh = {
  #   enable = true;
  #   extensions = with pkgs; [gh-markdown-preview]; # オススメ
  #   settings = {
  #     editor = "nvim";
  #   };
  # };
}
