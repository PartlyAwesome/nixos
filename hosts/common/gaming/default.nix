{
  self,
  nixpkgs,
  lib,
  inputs,
  hostsPath,
  ...
}:

{
  imports = [
    ./steam.nix
  ];
}
