{
  config,
  inputs,
  ...
}: {
  imports = with inputs; [
    auto-cpufreq.nixosModules.default
  ];
  services.power-profiles-daemon.enable = !config.host-options.laptop.enable;
  programs.auto-cpufreq.enable = config.host-options.laptop.enable;
}
