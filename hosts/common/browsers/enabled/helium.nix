{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.helium.overlays.default];
  home-pkgs = [pkgs.helium];
}
