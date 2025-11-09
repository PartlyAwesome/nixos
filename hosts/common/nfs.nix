{
  config,
  ...
}:

{
  fileSystems."/mnt/wsg" = {
    device = "where-shit-goes:/volume1";
    fsType = "nfs";
    options = [
      "nfsvers=4.1"
      "x-systemd.automount" "noauto"
      "x-systemd.idle-timeout=3600"
    ];
  };
  boot.supportedFilesystems = [ "nfs" ];
}
