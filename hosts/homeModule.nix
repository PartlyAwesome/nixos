{modules}: {
  lib,
  inputs,
  hostsPath,
  user,
  ...
}: {
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        hostsPath
        ;
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
