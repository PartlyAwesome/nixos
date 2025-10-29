{
  self,
  nixpkgs,
  lib,
  inputs,
  ...
}:

{
  imports = with inputs; [
    auto-cpufreq.nixosModules.default
  ];
}
