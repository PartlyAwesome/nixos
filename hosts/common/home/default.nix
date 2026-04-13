{pkgs, ...}: {
  imports = [
    ./proton
    ./catppuccin.nix
    #./session-vars.nix
    ./alacritty.nix
    ./vesktop.nix
    ./flameshot.nix
    ./yt-dlp.nix
    ./rga.nix
    ./bat.nix
    ./qbit.nix
    ./zip.nix
    ./btop.nix
    ./jellyfin.nix
  ];

  # to access the user's name, use config.home.username!
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wget
    unzip
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
    davinci-resolve
  ];

  home.stateVersion = "25.05";
}
