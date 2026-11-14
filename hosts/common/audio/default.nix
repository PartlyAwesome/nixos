{pkgs, ...}: {
  imports = [
    ./qpwgraph.nix
    ./pipewire-extra.nix
    ./mixid.nix # mixid for audient id14
  ];

  environment.systemPackages = with pkgs; [
    ladspa-sdk
  ];

  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
