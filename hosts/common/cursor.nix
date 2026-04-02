{
  pkgs,
  lib,
  ...
}: let
  stdenvNoCC = pkgs.stdenvNoCC;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  posy-scalable = pkgs.callPackage ./posy-scalable.nix {inherit lib stdenvNoCC fetchFromGitHub;};
  theme-name = "posys_cursor_scalable_mono_black";
in {
  environment.systemPackages = with pkgs; [xsettingsd xrdb posy-scalable];
  home-pkgs = [posy-scalable];
  xdg.icons = {
    enable = true; # it is enabled by default, but there is never any harm in doubling down
    fallbackCursorThemes = [theme-name];
  };
  hm.services.xsettingsd.enable = true;
  hm.home.pointerCursor = {
    enable = true;
    name = theme-name;
    package = posy-scalable;

    dotIcons.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    sway.enable = true;
    x11.enable = true;
  };
}
