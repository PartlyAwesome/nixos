{
  pkgs,
  lib,
  ...
}: let
  stdenvNoCC = pkgs.stdenvNoCC;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  posy-scalable = pkgs.callPackage ./posy-scalable.nix {inherit lib stdenvNoCC fetchFromGitHub;};
in {
  environment.systemPackages = with pkgs; [xsettingsd xorg.xrdb posy-scalable];
  hm.services.xsettingsd.enable = true;
  hm.home.pointerCursor = {
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
