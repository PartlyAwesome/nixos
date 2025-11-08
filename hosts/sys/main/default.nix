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
    ])
  ];

  #home.packages = with pkgs; [
    #jellyfin-media-player
  #];

  networking.hostName = "nixos-main";

  system.stateVersion = "25.05";
}
