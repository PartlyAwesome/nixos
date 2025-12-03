{hostsPath, ...}: {
  imports = map hostsPath [
    "common/home/jellyfin.nix"
  ];
}
