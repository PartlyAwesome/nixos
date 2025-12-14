{
  inputs,
  nixpkgs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.cachyos.overlay];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
