{
  user,
  modules,
}: {
  lib,
  inputs,
  ...
}: {
  imports = with inputs; [
    home-manager.nixosModules.home-manager
    (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" user])
    (lib.mkAliasOptionModule ["home-pkgs"] ["hm" "home" "packages"])
  ];
  hm.manual.manpages.enable = false;
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
