{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./extra-drives.nix
  ];

  boot.kernelModules = ["v4l2loopback"];
  boot.initrd.availableKernelModules = [
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia"
    "nvidia_uvm"
  ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
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

  host.hardware.ramsize = 64;
}
