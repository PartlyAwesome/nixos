{inputs, ...}: {
  imports = [
    ./hardware
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x280
  ];

  networking.hostName = "nixos-x280";

  system.stateVersion = "25.05";
}
