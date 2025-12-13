{
  lib,
  hostsPath,
  ...
}: {
  imports = lib.flatten [
    ./hardware
    #./3proxy.nix # proxy for fast ps4 downloads
    #./monitor-links.nix # monitors network links if there is an issue, didn't solve it
    (map hostsPath [
      "common/gaming"
      "common/keymap-uk.nix"
      "common/apollo.nix"
    ])
  ];

  networking.hostName = "nixos-main";

  system.stateVersion = "25.05";
}
