{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.mixid.overlays.default];
  hm.home.packages = with pkgs; [
    mixid
  ];
}
