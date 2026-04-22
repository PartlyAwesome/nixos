{pkgs, ...}: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      defaultSession = "plasma";
      plasma-login-manager.enable = true;
    };
  };
}
