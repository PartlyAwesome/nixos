{pkgs, ...}: {
  user.extraGroups = ["dialout" "tty"];

  hardware.keyboard.qmk = {
    enable = true;
    keychronSupport = true;
  };

  home-pkgs = with pkgs; [
    zmk-studio
  ];
}
