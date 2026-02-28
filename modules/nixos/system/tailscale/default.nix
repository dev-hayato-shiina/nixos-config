{ config, ... }:

{
  # Tailscale VPN クライアントを有効化する
  services.tailscale.enable = true;

  networking.firewall = {
    enable = true;

    # Tailscale の仮想 NIC を信頼済みインターフェースとして登録する
    # これにより `<Tailscale のホスト名>:<ポート番号>` でのアクセスが可能になる
    trustedInterfaces = [ "tailscale0" ];

    # Tailscale が使用する UDP ポートをファイアウォールで開放する
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}
