{ config, ... }:

{
  users.users.hayley = {
    isNormalUser = true;
    description = "Hayley";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
  };
}
