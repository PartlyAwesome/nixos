{
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = config.host-options.gaming.enable;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };
}
