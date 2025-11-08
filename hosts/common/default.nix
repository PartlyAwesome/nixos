{
  self,
  nixpkgs,
  lib,
  inputs,
  hostsPath,
  ...
}:

{
  imports = lib.flatten [
    (with inputs; [
      chaotic.nixosModules.default
      catppuccin.nixosModules.default
      home-manager.nixosModules.home-manager
    ])
    (map hostsPath [
      "common/home"
    ])
    ./bootloader.nix
    ./kernel.nix
    ./lix.nix
    ./networking.nix
    ./locale.nix
    ./kde.nix
    ./printing.nix
    ./audio.nix
    ./hayley.nix
    ./adb.nix
    ./ssh.nix
    #./session-vars.nix
    ./catppuccin.nix
    ./locate.nix
  ];
}
