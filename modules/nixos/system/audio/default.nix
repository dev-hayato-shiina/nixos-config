{ ... }:

{
  # PulseAudio を無効化する（PipeWire と競合するため）
  services.pulseaudio.enable = false;

  # リアルタイム優先度のスケジューリングを非 root ユーザーに許可する
  # PipeWire の低レイテンシ処理に必要
  security.rtkit.enable = true;

  # オーディオサーバーに PipeWire を使用する
  services.pipewire = {
    enable = true;
    alsa.enable = true;        # ALSA アプリケーションのサポートを有効化する
    alsa.support32Bit = true;  # 32bit ALSA アプリケーション（Wine など）のサポートを有効化する
    jack.enable = true;        # JACK アプリケーションのサポートを有効化する
    pulse.enable = true;       # PulseAudio 互換レイヤーを有効化する
  };

  # マイク入力のノイズをリアルタイムで除去するアプリ NoiseTorch を有効化する
  programs.noisetorch.enable = true;
}
