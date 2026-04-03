{ pkgs, ... }:
{
  # Niri で XWayland を使えるようにするには、xwayland-satelite を使用する必要がある(公式)
  # 関連設定: modules/hm/discord.nix, modules/hm/niri/config.kdl
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  systemd.user.services.xwayland-satellite = {
    description = "Xwayland Satellite";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      Restart = "on-failure";
    };
    environment = {
      # 使用する X のディスプレイ番号
      # | 実際に割り当てられた番号は `ls /tmp/.X11-unix/` で確認すること
      # | この値は config.kdl の DISPLAY、modules/hm/discord.nix の Override、Zsh のエイリアスと一致している必要がある
      DISPLAY = ":1";
    };
  };
}
