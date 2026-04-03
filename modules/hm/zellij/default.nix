{ pkgs, ... }:
let
  bg = "1a1b26";
  surface = "24283b";
  surface1 = "414868";
  fg = "a9b1d6";
  blue = "7aa2f7";
  orange = "ff9e64";
  magenta = "bb9af7";
  green = "9ece6a";
  yellow = "e0af68";
  red = "ff757f";
  cyan = "7dcfff";
  white = "c0caf5";
in
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true; # zsh 起動時に Zellij を自動起動するインテグレーションを有効化する
  };

  xdg.configFile."zellij/config.kdl" = {
    force = true;
    source = ./config.kdl;
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="file://${pkgs.zjstatus}/bin/zjstatus.wasm" {
                    format_left   "{mode}#[bg=#${bg}] {tabs}"
                    format_center ""
                    format_right  "#[bg=#${bg},fg=#${blue}]#[bg=#${blue},fg=#${bg},bold]   #[bg=#${surface},fg=#${white},bold] {session} #[bg=#${surface1},fg=#${fg}]"
                    format_space  ""
                    format_hide_on_overlength "true"
                    format_precedence "crl"

                    border_enabled "false"

                    mode_normal        "#[bg=#${green},fg=#${bg},bold] NORMAL #[bg=#${bg},fg=#${green}]"
                    mode_locked        "#[bg=#${surface1},fg=#${fg},bold] LOCKED #[bg=#${bg},fg=#${surface1}]"
                    mode_resize        "#[bg=#${red},fg=#${bg},bold] RESIZE #[bg=#${bg},fg=#${red}]"
                    mode_pane          "#[bg=#${blue},fg=#${bg},bold] PANE #[bg=#${bg},fg=#${blue}]"
                    mode_tab           "#[bg=#${cyan},fg=#${bg},bold] TAB #[bg=#${bg},fg=#${cyan}]"
                    mode_scroll        "#[bg=#${yellow},fg=#${bg},bold] SCROLL #[bg=#${bg},fg=#${yellow}]"
                    mode_enter_search  "#[bg=#${blue},fg=#${bg},bold] SEARCH #[bg=#${bg},fg=#${blue}]"
                    mode_search        "#[bg=#${blue},fg=#${bg},bold] SEARCH #[bg=#${bg},fg=#${blue}]"
                    mode_rename_tab    "#[bg=#${cyan},fg=#${bg},bold] RENAME #[bg=#${bg},fg=#${cyan}]"
                    mode_rename_pane   "#[bg=#${blue},fg=#${bg},bold] RENAME #[bg=#${bg},fg=#${blue}]"
                    mode_session       "#[bg=#${magenta},fg=#${bg},bold] SESSION #[bg=#${bg},fg=#${magenta}]"
                    mode_move          "#[bg=#${orange},fg=#${bg},bold] MOVE #[bg=#${bg},fg=#${orange}]"
                    mode_prompt        "#[bg=#${blue},fg=#${bg},bold] PROMPT #[bg=#${bg},fg=#${blue}]"
                    mode_tmux          "#[bg=#${orange},fg=#${bg},bold] TMUX #[bg=#${bg},fg=#${orange}]"

                    tab_normal              "#[bg=#${bg},fg=#${blue}]#[bg=#${blue},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${fg}] {name}{floating_indicator}#[bg=#${bg},fg=#${surface}]"
                    tab_normal_fullscreen   "#[bg=#${bg},fg=#${blue}]#[bg=#${blue},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${fg}] {name}{fullscreen_indicator}#[bg=#${bg},fg=#${surface}]"
                    tab_normal_sync         "#[bg=#${bg},fg=#${blue}]#[bg=#${blue},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${fg}] {name}{sync_indicator}#[bg=#${bg},fg=#${surface}]"

                    tab_active              "#[bg=#${bg},fg=#${orange}]#[bg=#${orange},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${white},bold] {name}{floating_indicator}#[bg=#${bg},fg=#${surface}]"
                    tab_active_fullscreen   "#[bg=#${bg},fg=#${orange}]#[bg=#${orange},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${white},bold] {name}{fullscreen_indicator}#[bg=#${bg},fg=#${surface}]"
                    tab_active_sync         "#[bg=#${bg},fg=#${orange}]#[bg=#${orange},fg=#${bg},bold] {index} #[bg=#${surface},fg=#${white},bold] {name}{sync_indicator}#[bg=#${bg},fg=#${surface}]"

                    tab_separator           "#[bg=#${bg}] "
                    tab_sync_indicator       " "
                    tab_fullscreen_indicator " 󰊓"
                    tab_floating_indicator   " 󰹙"
                }
            }
            children
        }
    }
  '';
}
