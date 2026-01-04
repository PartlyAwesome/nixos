{
  imports = [
    ./hardware-configuration.nix
    ./extra-drives.nix
  ];

  boot.kernelModules = ["v4l2loopback"];

  zramSwap.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
