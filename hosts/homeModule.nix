{
  user,
  modules,
}: {
  config,
  lib,
  inputs,
  ...
}: {
  imports = with inputs; [
    home-manager.nixosModules.home-manager
    (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" user])
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users.${user}.imports = lib.flatten [
      ./common/home
      modules
    ];
  };
}
