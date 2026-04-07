{pkgs, ...}: {
  home-pkgs = with pkgs; [
    chromium
    google-chrome
  ];
}
