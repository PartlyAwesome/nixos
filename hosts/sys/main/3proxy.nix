{config, ...}: {
  networking.firewall.allowedTCPPorts = [8080];
  networking.firewall.allowedUDPPorts = [8080];
  services._3proxy = {
    enable = true;
    services = [
      {
        type = "proxy";
        auth = ["none"];
        bindPort = 8080;
      }
    ];
  };
}
