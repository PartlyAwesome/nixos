{
  config,
  inputs,
  ...
}: {
  nix.subs.urls = ["https://niri.cachix.org"];
  nix.subs.keys = ["niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="];
  imports = with inputs; [
    dms.nixosModules.greeter
    dms-plugins.modules.default
    niri.nixosModules.niri
  ];
  hm.imports = with inputs; [
    dms.homeModules.dank-material-shell
    dms.homeModules.niri
  ];
  nixpkgs.overlays = with inputs; [quickshell.overlays.default];
  user.extraGroups = ["greeter"];
  hm.programs.dank-material-shell = {
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
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = config.user.home;
  };
  programs.niri.enable = true;
  hm.programs.niri.settings = {};
  # GNOME ssh agent can't cooexist with the other ssh agent, so needs to be disabled
  services.gnome.gcr-ssh-agent.enable = false;
}
