{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    font-awesome
    cantarell-fonts
    libnotify
  ];

  # https://github.com/Alexays/Waybar/wiki/Examples
  # https://github.com/kamlendras/waybar-macos-sequoia
  programs.waybar = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 5;
        margin-top = 5;

        modules-left = [
          "custom/launcher"
          "custom/bitwarden"
          "custom/chrome"
          "custom/discord"
        ];

        modules-center = [ "clock" ];

        modules-right = [
          "mpd"
          "idle_inhibitor"
          "temperature"
          "cpu"
          "memory"
          "network"
          "pulseaudio"
          "backlight"
          "keyboard-state"
          "battery"
          "battery#bat2"
          "tray"
          "custom/power"
        ];

        "custom/launcher" = {
          format = "🔍";
          on-click = "${pkgs.wofi}/bin/wofi --show drun";
          tooltip = false;
        };

        "custom/bitwarden" = {
          format = "🔐";
          on-click = "${pkgs.bitwarden-desktop}/bin/bitwarden";
          tooltip-format = "Bitwarden";
        };

        "custom/chrome" = {
          format = "🌐";
          on-click = "${pkgs.google-chrome}/bin/google-chrome-stable";
          tooltip-format = "Chrome";
        };

        "custom/discord" = {
          format = "💬";
          on-click = "notify-send -t 3000 -i discord 'Discord' '起動中...' & env DISPLAY=:1 ${pkgs.flatpak}/bin/flatpak run com.discordapp.Discord";
          tooltip-format = "Discord";
        };

        "custom/power" = {
          format = "⏻";
          on-click = "${config.xdg.configHome}/waybar/scripts/powermenu.sh";
          tooltip-format = "Power Menu";
        };

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon} ";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

       "sway/scratchpad" = {
         format = "{icon} {count}";
         show-empty = false;
         format-icons = {
           empty = "";
           full = "";
         };
         tooltip = true;
         tooltip-format = "{app}: {title}";
        };

        mpd = {
          format = "  {title} - {artist} {stateIcon} [{elapsedTime:%M:%S}/{totalTime:%M:%S}] {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}[{songPosition}/{queueLength}] [{volume}%]";
          format-disconnected = " Disconnected";
          format-stopped = " {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped";
          unknown-tag = "N/A";
          interval = 2;
          consume-icons = { on = " "; };
          random-icons = { on = " "; };
          repeat-icons = { on = " "; };
          single-icons = { on = "1 "; };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
          on-click = "mpc toggle";
          on-click-right = "foot -a ncmpcpp ncmpcpp";
          on-scroll-up = "mpc volume +2";
          on-scroll-down = "mpc volume -2";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = { spacing = 10; };

        clock = {
          format = "{:%Y年%m月%d日(%a) %H:%M}";
          locale = "ja_JP.UTF-8";
          tooltip-format = "<big>{:%Y年%m月}</big>\n<tt><small>{calendar}</small></tt>";
        };

        cpu = { format = "  {usage}%"; };

        memory = { format = " {}%"; };

        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{icon} {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" ];
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };

        "battery#bat2" = { bat = "BAT2"; };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = " {ifname}";
          tooltip-format = " {ifname} via {gwaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "Disconnected ⚠ {ifname}";
          format-alt = " {ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = " {icon} {volume}% {format_source}";
          format-bluetooth-muted = "  {icon} {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          on-click-right = "foot -a pw-top pw-top";
        };
      }
    ];
  };

  xdg.configFile."waybar/scripts/powermenu.sh" = {
    force = true;
    source = ./powermenu.sh;
  };
}
