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
    displayManager = {
      defaultSession = "plasma";
      plasma-login-manager.enable = true;
    };
  };
}
