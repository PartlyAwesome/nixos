{
  fileSystems."/mnt/wsg" = {
    device = "where-shit-goes:/volume1";
    fsType = "nfs";
    options = [
      "nfsvers=4.1"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=900"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "_netdev"
      # "forcedirectio"
      # "largefiles"
      "tcp"
    ];
  };
  boot.supportedFilesystems = ["nfs"];
  services.rpcbind.enable = true;
}
