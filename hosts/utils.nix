final: prev: let
  inherit (prev) mapAttrsToList filterAttrs genAttrs;
  inherit (prev.path) append;
  utils = {
    dirFiles = dir:
      mapAttrsToList
      (name: value: append dir name)
      (filterAttrs (n: v: v == "regular") (builtins.readDir dir));
    enableList = list: genAttrs list (_: true);
  };
in {
  inherit utils;
}
