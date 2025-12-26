{config, ...}: {
  imports = [
    ./hardware
  ];

  host-options = {
    laptop.enable = true;
    keymap = config.host-options.keymaps.asus;
  };

  networking.hostName = "nixos-asus";

  system.stateVersion = "25.05";
}
