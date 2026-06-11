{
  fileSystems."/mnt/wsg" = {
    device = "where-shit-goes:/volume1";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=900"
      "forcedirectio"
      "largefiles"
      "tcp"
    ];
  };
  boot.supportedFilesystems = ["nfs"];
  services.rpcbind.enable = true;
}
