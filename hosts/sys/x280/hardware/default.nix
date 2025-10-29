{ self, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = [ "usbhid" "sd_mod" ];

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16*1024;
    }
  ];

  zramSwap.enable = true;

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
}
  
