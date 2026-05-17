{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    # vscode.fhs
  ];
  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscode.fhs;
  # };
}
