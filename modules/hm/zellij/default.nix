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
                        pane name="1"
                        pane name="2"
                        pane name="3"
                    }
                }
                pane stacked=true size="30%" {
                    pane name="4"
                    pane name="5"
                    pane name="6"
                }
            }
            floating_panes {
                pane name="7" {
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
