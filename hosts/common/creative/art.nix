{pkgs, ...}: {
  home-pkgs = [pkgs.krita];

  hardware.opentabletdriver.enable = true;
}
