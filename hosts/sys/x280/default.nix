{
  lib,
  inputs,
  hostsPath,
  ...
}: {
  imports = lib.flatten [
    ./hardware
    (map hostsPath [
      "common"
      "common/gaming"
      "common/laptop"
      "common/keymap-uk.nix"
    ])
    (with inputs; [
      nixos-hardware.nixosModules.lenovo-thinkpad-x280
    ])
  ];

  networking.hostName = "nixos-x280";

  system.stateVersion = "25.05";
}
