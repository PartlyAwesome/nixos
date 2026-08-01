{pkgs, ...}: {
  home-pkgs = [pkgs.dolphin-emu];
  services.udev.packages = [pkgs.dolphin-emu];
}
