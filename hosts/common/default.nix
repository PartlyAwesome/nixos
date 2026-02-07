{
  imports = [
    # nix settings
    ./settings.nix

    # substitutors
    ./subs.nix

    # lix
    ./lix.nix

    # nh
    ./nh.nix

    # common system stuff
    ./bootloader.nix
    ./kernel.nix
    ./networking.nix
    ./locale.nix
    ./printing.nix
    ./killall.nix

    # pipewire things
    ./audio

    # fish and the like
    ./shell

    # neovim
    ./nvim.nix

    # desktop environment
    ./kde.nix

    # phone adb
    ./adb.nix

    # ssh & remote access
    ./ssh.nix

    # QMK support
    ./qmk.nix

    # theming
    ./catppuccin.nix

    # find things
    ./locate.nix

    # streaming
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
