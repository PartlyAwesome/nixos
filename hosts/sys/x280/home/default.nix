{
  inputs,
  setupHomeManager,
  ...
}: {
  imports = with inputs; [home-manager.nixosModules.home-manager];
  home-manager = setupHomeManager ./home.nix;
}
