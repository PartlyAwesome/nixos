{
  self,
  nixpkgs,
  lib,
  inputs,
  hostsPath,
  host,
  setValueForUsers,
  system,
  ...
}:

{
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        hostsPath
        host
        system
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users = setValueForUsers { imports = [ ./home.nix ]; };
  };
}
