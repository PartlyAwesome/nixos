{
  imports = [
    ./hardware
    #./3proxy.nix # proxy for fast ps4 downloads
    #./monitor-links.nix # monitors network links if there is an issue, didn't solve it
  ];

  networking.hostName = "nixos-main";

  system.stateVersion = "25.05";
}
