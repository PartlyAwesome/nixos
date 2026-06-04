{pkgs, ...}: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  home-pkgs = with pkgs.kdePackages; [
    krecorder
  ];
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    # Using DMS, we don't need SDDM
    # displayManager = {
    #   defaultSession = "plasma";
    #   plasma-login-manager.enable = true;
    # };
  };
}
