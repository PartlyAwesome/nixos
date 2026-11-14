{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  options.kernel = lib.mkOption {
    default = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
    type = lib.types.raw;
    description = "active kernel packages";
  };

  config = {
    nix.subs.urls = ["https://cache.lantian.pub/lantian"];
    nix.subs.keys = ["lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="];

    nixpkgs.overlays = [inputs.cachyos.overlays.pinned];
    boot.kernelPackages = lib.mkDefault config.kernel; # lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
    boot.kernelParams = ["threadirqs"];

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
  };
}
