{pkgs, ...}: {
  imports = [
    ./cursor.nix
    ./proton
    ./catppuccin.nix
    #./firefox.nix
    ./zen.nix
    #./session-vars.nix
    ./alacritty.nix
    ./vesktop.nix
    ./git.nix
    ./flameshot.nix
    ./mpv.nix
    ./yt-dlp.nix
    ./rga.nix
    ./bat.nix
    ./qbit.nix
    ./zip.nix
    ./btop.nix
  ];

  # to access the user's name, use config.home.username!
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    chromium
    google-chrome
    #jellyfin-media-player
    wget
    unzip
    obs-studio
    gimp
    nurl
    catppuccin-kde
    bitwarden-desktop
    bitwarden-cli
    moonlight-qt
    fastfetch
    ffmpeg-full
    pinta
    heroic
    rustdesk-flutter
  ];

  home.stateVersion = "25.05";
}
