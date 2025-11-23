{
  ...
}:

{
  services.xsettingsd.enable = true;
  home.pointerCursor = {
    enable = true;
    name = "posys_cursor_scalable_mono_black";
    package = (import ./posy-scalable.nix);

    dotIcons.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    sway.enable = true;
    x11.enable = true;
  };
}
