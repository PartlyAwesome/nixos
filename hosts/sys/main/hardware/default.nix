{
  lib,
  pkgs,
  ...
}: {
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
  boot.extraModprobeConfig =
    "options nvidia "
    + lib.concatStringsSep " " [
      # see: https://github.com/TLATER/dotfiles/blob/master/nixos-modules/nvidia/default.nix and https://gist.github.com/chrisheib/162c8cad466638f568f0fb7e5a6f4f6b#file-config_working-nix
      "NVreg_UseKernelSuspendNotifiers=1"
      "NVreg_UsePageAttributeTable=1"
      "NVreg_RegistryDwords=RMUseSwI2c=0x01;RMI2cSpeed=100"
    ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    EGL_PLATFORM = "wayland";
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vdpauinfo
      libva-utils
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
