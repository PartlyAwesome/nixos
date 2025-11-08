{
  self,
  nixpkgs,
  lib,
  inputs,
  hostsPath,
  host,
  ...
}:

{
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs hostsPath host;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users.hayley.imports = [ ./home.nix ];
  };
}
