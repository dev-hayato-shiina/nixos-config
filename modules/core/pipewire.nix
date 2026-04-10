{ pkgs, ... }:
{
  services = {
    # PulseAudio を無効化する（PipeWire と競合するため）
    pulseaudio.enable = false;

    pipewire = {
      enable = true; # オーディオサーバーに PipeWire を使用する
      pulse.enable = true; # PulseAudio 互換レイヤーを有効化する
      jack.enable = true; # JACK アプリケーションのサポートを有効化する
alsa = {
        enable = true; # ALSA アプリケーションのサポートを有効化する
        support32Bit = true; # 32bit ALSA アプリケーション（Wine など）のサポートを有効化する
      };
    };
  };
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ alsa-utils ];

  # マイク入力のノイズをリアルタイムで除去するアプリ NoiseTorch を有効化する
  programs.noisetorch.enable = true;
}
