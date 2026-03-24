{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    fzf
    ripgrep
    lazydocker
    lazygit
  ];

  programs.neovim = {
    extraWrapperArgs = let
      nvim-treesitter-parsers = let
        nvim-treesitter = pkgs.vimPlugins.nvim-treesitter;
      in
        builtins.map (grammar: nvim-treesitter.grammarToPlugin grammar) nvim-treesitter.allGrammars;
    in [
      "--set"
      "NVIM_TREESITTER_PARSERS"
      (lib.concatStringsSep "," nvim-treesitter-parsers)
    ];
  };
}
