{
  pkgs,
  lib,
  ...
}: let
  stdenvNoCC = pkgs.stdenvNoCC;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  posy-scalable = pkgs.callPackage ./posy-scalable.nix {inherit lib stdenvNoCC fetchFromGitHub;};
in {
  services.xsettingsd.enable = true;
  home.pointerCursor = {
    enable = true;
    name = "posys_cursor_scalable_mono_black";
    package = posy-scalable;

    dotIcons.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    sway.enable = true;
    x11.enable = true;
  };
}
