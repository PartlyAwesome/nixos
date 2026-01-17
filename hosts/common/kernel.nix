{
  inputs,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.cachyos.overlays.pinned];
  boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
}
