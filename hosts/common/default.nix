{
  imports = [
    # pipewire things
    ./audio

    # fish and the like
    ./shell

    ./bootloader.nix
    ./kernel.nix
    ./lix.nix
    ./nvim.nix
    ./networking.nix
    ./locale.nix
    ./kde.nix
    ./printing.nix
    ./adb.nix
    ./ssh.nix
    #./session-vars.nix
    ./catppuccin.nix
    ./locate.nix
    ./obs.nix
    #./flatpak.nix

    # remove xterm
    ./rem-xterm.nix

    # mount NAS
    ./nfs.nix

    # fonts!
    ./fonts.nix

    # input remapping
    ./inputs.nix

    # appimages
    ./appimage.nix

    # udev rules
    ./udev.nix

    # secrets management
    ./secrets

    # localsend
    ./localsend.nix
  ];
}
