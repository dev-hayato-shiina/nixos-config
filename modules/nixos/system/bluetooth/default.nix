{ config, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;       # Bluetooth を有効化する
    powerOnBoot = true;  # 起動時に Bluetooth アダプタを自動的にオンにする
  };

  # Bluetooth デバイスのペアリング・管理を行う GUI ツール Blueman を有効化する
  services.blueman.enable = true;
}
