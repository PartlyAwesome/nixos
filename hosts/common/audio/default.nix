{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./qpwgraph.nix
    ./pipewire-extra.nix
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
