{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = ["usbhid" "sd_mod"];

  hardware.graphics = {
    enable = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  host.hardware.ramsize = 16;
}
