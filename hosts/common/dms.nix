{
  config,
  inputs,
  ...
}: {
  imports = [inputs.dms-plugins.modules.default];
  nixpkgs.overlays = [inputs.quickshell.overlays.default];
  programs = {
    niri.enable = true;
    dms-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = false;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
    };
  };
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
