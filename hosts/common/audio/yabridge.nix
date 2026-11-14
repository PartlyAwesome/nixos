{pkgs, ...}: {
  home-pkgs = with pkgs; [
    yabridge
    yabridgectl
    wineWow64Packages.yabridge
    winetricks
  ];
}
