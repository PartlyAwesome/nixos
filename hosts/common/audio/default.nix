{pkgs, ...}: {
  imports = [
    ./qpwgraph.nix
    ./pipewire-extra.nix
    ./mixid.nix # mixid for audient id14
    ./mus.nix
    ./yabridge.nix
    ./bitwig.nix
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
