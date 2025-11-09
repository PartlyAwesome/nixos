{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    qpwgraph
  ];
}
