{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = [
    "usbhid"
    "sd_mod"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia"
    "nvidia_uvm"
  ];

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
