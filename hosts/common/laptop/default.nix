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
  services.power-profiles-daemon.enable = false;
  programs.auto-cpufreq.enable = true;
}
