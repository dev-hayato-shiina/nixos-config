{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    lazydocker
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: with p; [
        bash
        c
        diff
        html
        javascript
        jsdoc
        json
        lua
        luadoc
        luap
        markdown
        markdown-inline
        printf
        python
        query
        regex
        toml
        tsx
        typescript
        vim
        vimdoc
        xml
        yaml
      ]))
    ];
  };
}
