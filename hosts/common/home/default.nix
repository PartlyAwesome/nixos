{
  self,
  nixpkgs,
  lib,
  inputs,
  ...
}:

{
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users.hayley.imports = [ ./home.nix ];
  };
}
