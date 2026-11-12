{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [inputs.musnix.nixosModules.musnix];

  musnix = {
    enable = true;
    alsaSeq.enable = true;
    ftcqs.enable = true;
  };

  musnix.kernel = {
    enable = true;
    packages = config.boot.kernelPackages;
  };

  # musnix sets vm.swappiness to 10, we don't want that
  kernel.sysctl."vm.swappiness" = lib.mkForce 100;
}
