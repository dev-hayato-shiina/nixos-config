{
  inputs,
  pkgs,
  ...
}:
{
  zjstatus = pkgs.callPackage ./zjstatus {
    inherit inputs;
  };
}
