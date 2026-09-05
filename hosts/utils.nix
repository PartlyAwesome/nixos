lib: let
  inherit (lib) mapAttrsToList filterAttrs genAttrs;
  inherit (lib.path) append;
in {
  dirFiles = dir:
    mapAttrsToList
    (name: _: append dir name)
    (filterAttrs (_: v: v == "regular") (builtins.readDir dir));
  enableList = list: genAttrs list (_: true);
}
