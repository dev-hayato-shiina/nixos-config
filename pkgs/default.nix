{
  inputs,
  pkgs,
  ...
}:
{
  zjstatus = pkgs.callPackage ./zjstatus {
    inherit inputs;
  };
  zjstatus-hints = pkgs.callPackage ./zjstatus-hints {
    inherit inputs;
  };
}
