{ config, ... }:

{
  services = {
    xserver.enable = true;
    desktopManager.plasma6 = {
      enable = true;
      # enable Qt5Integration = true;
    };
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
