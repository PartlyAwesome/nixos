{
  lib,
  hostsPath,
  ...
}: {
  imports = lib.flatten [
    ./hardware
    (map hostsPath [
      "common/laptop"
      "common/keymap-asus.nix"
    ])
  ];

  networking.hostName = "nixos-asus";

  system.stateVersion = "25.05";
}
