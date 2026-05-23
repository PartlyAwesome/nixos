{
  user.extraGroups = ["networkmanager"];
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
}
