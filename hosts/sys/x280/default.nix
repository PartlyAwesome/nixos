{inputs, ...}: {
  imports = [
    ./hardware
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x280
  ];

  system.stateVersion = "25.05";
}
