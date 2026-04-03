{ config, pkgs, host, ... }:
{
  # Tailscale VPN クライアントを有効化
  services.tailscale.enable = true;
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
    firewall = {
      enable = true;

      # Tailscale の仮想NIC を信頼済みインターフェースとして登録する
      # これにより `<Tailscale のホスト名>:<ポート番号>` でのアクセスが可能になる
      trustedInterfaces = [ "tailscale0" ];

      # Tailscale が使用するUDPポートをファイアウォールで開放する
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
