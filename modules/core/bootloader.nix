{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/top-level/linux-kernels.nix
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    initrd = {
      # initrd（Stage 1）のverboseログを無効化
      verbose = false;
      # Intel GPU ドライバーを initrd に組み込み Plymouth を早期起動させる
      # これにより DRM フレームバッファーを Plymouth が先に掌握し、
      # カーネルメッセージが画面に表示されなくなる
      kernelModules = [ "i915" ];
    };
    # 起動時のカーネルメッセージを非表示にする
    # ESC キーで元のメッセージを表示可能、起動後は journalctl -b で確認できる
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      # カーソルの点滅を非表示
      "vt.global_cursor_default=0"
      # systemdのステータス表示を抑制
      "systemd.show_status=false"
      # initrd内のsystemdステータスも抑制
      "rd.systemd.show_status=false"
      # SGX検出をスキップ（起動時の"SGX disabled or unsupported"メッセージを抑制）
      "nosgx"
    ];
    plymouth = {
      enable = true;
      theme = "connect";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ "connect" ];
        })
      ];
    };
  };
}
