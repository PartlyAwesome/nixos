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

  hardware.trackpoint = {
    enable = true;
    device = "TPPS/2 Elan TrackPoint";
    speed = 255;
    sensitivity = 255;
    emulateWheel = true;
  };

  host.hardware.ramsize = 16;
}
