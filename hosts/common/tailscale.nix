{
  services.tailscale = {
    enable = true;
    extraUpFlags = ["--login-server=https://head.to.partlyaweso.me"];
    extraSetFlags = ["--accept-dns=false"];
    useRoutingFeatures = "client";
  };
  services.resolved.dnsDelegates.tailscale.Delegate = {
    DNS = [
      "100.100.100.100"
      "fd7a:115c:a1e0::53"
    ];
    Domains = ["on.partlyaweso.me"];
  };
}
