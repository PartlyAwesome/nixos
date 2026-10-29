{
  inputs,
  lib,
  pkgs,
  ...
}: {
  nix.subs.urls = ["https://cache.lantian.pub/lantian"];
  nix.subs.keys = ["lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="];
  nixpkgs.overlays = [inputs.cachyos.overlays.pinned];
  boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;

  boot.zswap = {
    enable = true;
    compressor = "lz4";
  };

  # zswap needs swap, so we'll rely on an option that each sys can set
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 64 * 1024;
    }
  ];
}
