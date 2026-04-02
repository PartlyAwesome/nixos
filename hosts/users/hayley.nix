{lib, ...}: {
  imports = [
    (lib.mkAliasOptionModule ["user"] ["users" "users" "hayley"])
  ];
  user = {
    isNormalUser = true;
    description = "Hayley";
    extraGroups = ["wheel"];
  };
}
