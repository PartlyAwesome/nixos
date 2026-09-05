{
  imports = [
    # horrible hack
    # ./pkgs-small.nix
    # nix settings
    ./settings.nix

    # substitutors
    ./subs.nix
    ./cuda.nix # cuda binary packaging & support

    # lix
    ./lix

    # nix helper stuff
    ./nh.nix
    ./develop.nix
    ./direnv.nix

    # common system stuff
    ./bootloader.nix
    ./nixos-core.nix
    ./kernel.nix
    ./networking.nix
    ./locale.nix
    ./printing.nix
    ./killall.nix
    ./git.nix

    # pipewire things
    ./audio

    # fish and the like
    ./shell

    # xdg things
    ./xdg.nix

    # browsers
    ./browsers

    # neovim
    ./nvim.nix

    # desktop environment
    ./kde.nix

    # discord
    ./discord

    # partition and disk formatting
    ./format.nix

    # phone adb
    ./adb.nix

    # ftp
    ./ftp.nix

    # ssh & remote access
    ./ssh.nix
    ./tailscale.nix

    # QMK support
    ./qmk.nix

    # theming
    ./catppuccin.nix
    ./cursor.nix

    # find things
    ./locate.nix

    # streaming
    ./obs.nix

    # notes
    ./obsidian.nix

    # i need flatpak for dolphin, because nixpkgs dolphin doesn't work and crashes
    ./flatpak.nix

    # remove xterm
    ./rem-xterm.nix

    # mount NAS
    ./nfs.nix

    # fonts!
    ./fonts.nix

    # input remapping
    ./inputs.nix
    ./macro.nix

    # appimages
    ./appimage.nix

    # udev rules
    ./udev.nix

    # localsend
    ./localsend.nix

    # mixid for audient id14
    ./mixid.nix

    # video players
    ./mpv.nix
  ];
}
