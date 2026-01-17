{
  services.scx = {
    enable = true;
    scheduler = "scx_cosmos";
    extraArgs = [
      "-m"
      "performance"
      "-c"
      "0"
      "-p"
      "0"
      "-w"
    ];
  };
}
