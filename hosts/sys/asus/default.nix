{
  lib,
  hostsPath,
  ...
}: {
  imports = lib.flatten [
    ./hardware
    ./home
    (map hostsPath [
      "common"
      "common/laptop"
      "common/keymap-asus.nix"
    ])
  ];

  networking.hostName = "nixos-asus";

  system.stateVersion = "25.05";
}
