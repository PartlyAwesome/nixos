{
  services.tailscale = {
    enable = true;
    extraUpFlags = ["--login-server=https://head.to.partlyaweso.me"];
    useRoutingFeatures = "client";
  };
}
