{inputs, ...}: {
  imports = [
    ./hardware
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x280
  ];

  services.fprintd.enable = true;

  system.stateVersion = "25.05";
}
