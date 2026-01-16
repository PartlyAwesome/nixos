{
  inputs,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.cachyos.overlays.pinned];
  boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
  services.scx = {
    enable = true;
    scheduler = "scx_cosmos";
    extraArgs = [
      "-m"
      "performance"
      "-c"
      "0"
      "-p"
      "0"
      "-w"
    ];
  };
}
