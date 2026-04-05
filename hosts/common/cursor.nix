{
  inputs,
  pkgs,
  ...
}: let
  theme-name = "posys_cursor_scalable_mono_black";
in {
  nixpkgs.overlays = [inputs.posy-cursor.overlays.default];
  environment.systemPackages = with pkgs; [xsettingsd xrdb posy-scalable];
  home-pkgs = with pkgs; [posy-scalable];
  xdg.icons = {
    enable = true; # it is enabled by default, but there is never any harm in doubling down
    fallbackCursorThemes = [theme-name];
  };
  hm.services.xsettingsd.enable = true;
  hm.home.pointerCursor = {
    enable = true;
    name = theme-name;
    package = pkgs.posy-scalable;

    dotIcons.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    sway.enable = true;
    x11.enable = true;
  };
}
