{ config, lib, pkgs, ... }:

let
  # myModules.editor.neovim のオプションを参照するエイリアス
  cfg = config.myModules.editor.neovim;

  # 使用するプロファイルのディレクトリパス（full / minimal）
  profilePath = ./profiles/${cfg.profile};
in
{
  options.myModules.editor.neovim = {
    # 使用するプロファイルを選択する（full: フル装備 / minimal: 最小構成）
    profile = lib.mkOption {
      type = lib.types.enum [ "full" "minimal" ];
      default = "minimal";
      description = "neovim の設定プロファイル";
    };
  };

  config = {
    # GUI ツール群
    home.packages = with pkgs; [
      lazygit
      lazydocker
    ];

    programs.neovim = {
      # neovim から呼び出す外部コマンド
      extraPackages = with pkgs; [
        ripgrep
      ];
    };

    xdg.configFile = {
      # プロファイルの init.lua をエントリポイントとして配置する
      "nvim/init.lua" = {
        force = true;
        source = "${profilePath}/init.lua";
      };

      # プロファイルの lua/ 以下をまるごと配置する
      "nvim/lua" = {
        force = true;
        source = "${profilePath}/lua";
      };
    };
  };
}
