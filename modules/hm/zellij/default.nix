{ ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."zellij/config.kdl" = {
    force = true;
    source = ./config.kdl;
  };
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="zellij:tab-bar"
            }
            children
            pane size=1 borderless=true {
                plugin location="zellij:status-bar"
            }
        }
        tab {
            pane split_direction="Vertical" {
                pane split_direction="Horizontal" size="70%" {
                    pane stacked=true size="100%" {
                        pane
                        pane
                    }
                }
                pane size="30%"
            }
            floating_panes {
                pane {
                    x "10%"
                    y "10%"
                    width "80%"
                    height "80%"
                }
            }
        }
    }
  '';
}
