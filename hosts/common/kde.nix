{pkgs, ...}: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    # Using DMS, we don't need SDDM
    # displayManager = {
    # defaultSession = "plasma";
    # sddm = {
    #   enable = true;
    #   wayland.enable = true;
    # };
    # };
  };
}
