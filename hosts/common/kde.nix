{pkgs, ...}: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  services = {
    xserver.enable = true;
    desktopManager.plasma6 = {
      enable = true;
      # enable Qt5Integration = true;
    };
    displayManager = {
      defaultSession = "plasma";
      # sddm = {
      #   enable = true;
      #   wayland.enable = true;
      # };
      dms-greeter = {
        enable = true;
        compositor.name = "niri";
      };
    };
  };
  # for dms
  programs.niri.enable = true;
  # idfk
  services.gnome.gcr-ssh-agent.enable = false;
}
