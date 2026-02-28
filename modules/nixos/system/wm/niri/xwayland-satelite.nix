{ pkgs, ... }:

{
  # niriでXWaylandを使えるようにするには、xwayland-sateliteを使用する必要がある（公式が言っている）
  # 関連設定: modules/nix/flatpak/app/discord.nix, modules/home-manager/wm/niri/config.kdl
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
      # 使用するXのディスプレイ番号
      # 実際に割り当てられた番号は ls /tmp/.X11-unix/ で確認すること
      # この値はconfig.kdlのDISPLAY、modules/nix/flatpak/app/discord.nixのoverride、zshのエイリアスと一致している必要がある
      DISPLAY = ":1";
    };
  };
}
