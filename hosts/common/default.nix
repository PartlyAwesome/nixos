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
      "common/audio"
    ])
    ./bootloader.nix
    ./kernel.nix
    ./lix.nix
    ./nvim.nix
    ./networking.nix
    ./locale.nix
    ./kde.nix
    ./printing.nix
    ./hayley.nix
    ./adb.nix
    ./ssh.nix
    #./session-vars.nix
    ./catppuccin.nix
    ./locate.nix

    # remove xterm
    ./rem-xterm.nix

    # mount NAS
    ./nfs.nix
  ];
}
