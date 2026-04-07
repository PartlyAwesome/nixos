{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.mixid.overlays.default];
  user.extraGroups = ["audio"];
  home-pkgs = with pkgs; [
    mixid
  ];
}
