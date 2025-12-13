{
  host,
  user,
}: {
  inputs,
  hostsPath,
  system,
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
        system
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users.${user}.imports = [
      ./common/home
      ./sys/${host}/home
    ];
  };
}
