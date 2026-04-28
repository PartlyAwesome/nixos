{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
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
      size = config.host.hardware.ramsize * 1024;
    }
  ];
}
