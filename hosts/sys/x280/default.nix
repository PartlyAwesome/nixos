{
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware
    (with inputs; [
      nixos-hardware.nixosModules.lenovo-thinkpad-x280
    ])
  ];

  host-options = {
    gaming.enable = true;
    laptop.enable = true;
    keymap = config.host-options.keymaps.uk;
  };

  networking.hostName = "nixos-x280";

  system.stateVersion = "25.05";
}
