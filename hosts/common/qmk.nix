{pkgs, ...}: {
  hardware.keyboard.qmk = {
    enable = true;
    keychronSupport = true;
  };

  hm.home.packages = with pkgs; [
    zmk-studio
  ];
}
