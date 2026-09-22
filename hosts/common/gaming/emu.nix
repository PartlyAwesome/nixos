{pkgs, ...}: {
  home-pkgs = with pkgs; [dolphin-emu rmg-wayland];
  services.udev.packages = [pkgs.dolphin-emu];
}
