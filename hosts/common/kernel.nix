{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.cachyos.overlays.pinned];
  boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;

  # zswap
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=lz4"
    "zswap.max_pool_percent=25"
    "zswap.shrinker_enabled=1"
  ];
  boot.kernel.sysfs.module.zswap.parameters = {
    enabled = true;
    compressor = "lz4";
    max_pool_percent = 25;
    shrinker_enabled = true;
  };
  # required for lz4 zswap
  boot.initrd.systemd.enable = true;
  boot.initrd.kernelModules = ["lz4"];

  # zswap needs swap, so we'll rely on an option that each sys can set
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = config.host.hardware.ramsize * 1024;
    }
  ];
}
