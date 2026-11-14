{
  inputs,
  # config,
  lib,
  ...
}: {
  imports = [inputs.musnix.nixosModules.musnix];

  user.extraGroups = ["audio"];
  musnix = {
    enable = true;
    alsaSeq.enable = true;
    rtcqs.enable = true;
  };

  # musnix.kernel = {
  #   realtime = true;
  #   packages = config.kernel;
  # };

  # musnix sets vm.swappiness to 10, we don't want that
  boot.kernel.sysctl."vm.swappiness" = lib.mkForce 100;
}
