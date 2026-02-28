{ ... }:

{
  # ブートローダーに systemd-boot（旧称: gummiboot）を使用する
  boot.loader.systemd-boot.enable = true;

  # NixOS が EFI ブートエントリを自動管理できるよう EFI 変数の書き込みを許可する
  boot.loader.efi.canTouchEfiVariables = true;
}
