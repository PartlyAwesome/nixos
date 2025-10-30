{ self, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = [ "usbhid" "sd_mod" ];

  zramSwap.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
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
}
  
