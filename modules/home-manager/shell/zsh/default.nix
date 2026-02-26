{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    ripgrep
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
  };

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
    force = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true; # 自動補完
    autosuggestion.enable = true; # 入力サジェスト
    syntaxHighlighting.enable = true; # シンタックスハイライト
    shellAliases = {
      ".."    = "cd ..";
      "...."   = "cd ../..";
      "......"  = "cd ../../..";
      "........" = "cd ../../../..";
      grep = "rg";
      # Discord起動エイリアス - X11はxwayland-satellite経由 (modules/nix/flatpak/app/discord.nixで設定済み)
      discord = "DISPLAY=:1 flatpak run com.discordapp.Discord";
    };
    initContent = builtins.readFile ./.zshrc;
  };
}
