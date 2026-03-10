{config, ...}: {
  programs.niri.enable = true;
  services = {
    # GNOME ssh agent can't cooexist with the other ssh agent, so needs to be disabled
    gnome.gcr-ssh-agent.enable = false;
    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = config.user.home;
    };
  };
}
