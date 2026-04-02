{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = ["usbhid" "sd_mod"];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  host.hardware.ramsize = 24;
}
