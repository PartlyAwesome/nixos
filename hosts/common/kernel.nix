{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
