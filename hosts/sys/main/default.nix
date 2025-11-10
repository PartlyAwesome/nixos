{
  self,
  nixpkgs,
  pkgs,
  lib,
  inputs,
  hostsPath,
  ...
}:

{
  imports = lib.flatten [
    ./hardware
    (map hostsPath [
      "common"
      "common/gaming"
      "common/keymap-uk.nix"
      "common/apollo.nix"
    ])
  ];

  networking.hostName = "nixos-main";

  system.stateVersion = "25.05";
}
