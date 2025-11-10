{
  config,
  pkgs,
  lib,
  inputs,
  hostsPath,
  host,
  ...
}:

{
  imports = lib.flatten [
    (map hostsPath [
      "sys/${host}/home"
    ])
    ./catppuccin.nix
    ./firefox.nix
    ./zen.nix
    #./session-vars.nix
    ./alacritty.nix
    ./vesktop.nix
    ./git.nix
    ./flameshot.nix
    ./mpv.nix
  ];

  home.username = "hayley";
  home.homeDirectory = "/home/hayley";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    chromium
    #jellyfin-media-player
    wget
    unzip
    obs-studio
    gimp
    nurl
    catppuccin-kde
    rustdesk-flutter
    bitwarden-desktop
    bitwarden-cli
    btop
    moonlight-qt
    fastfetch
  ];

  home.stateVersion = "25.05";
}
