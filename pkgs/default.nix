{
  inputs,
  pkgs,
  system,
  ...
}:
{
  zjstatus = pkgs.callPackage ./zjstatus {
    inherit inputs system;
  };
}
