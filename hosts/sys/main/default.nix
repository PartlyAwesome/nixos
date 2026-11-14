{pkgs, ...}: {
  imports = [
    ./hardware
    ./scx.nix
    #./3proxy.nix # proxy for fast ps4 downloads
    #./monitor-links.nix # monitors network links if there is an issue, didn't solve it
  ];

  kernel = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;

  system.stateVersion = "25.05";
}
