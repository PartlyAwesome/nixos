final: prev: let
  inherit (prev) mapAttrsToList filterAttrs;
  inherit (prev.path) append;
  utils = {
    dirFiles = dir:
      mapAttrsToList
      (name: value: append dir name)
      (filterAttrs (n: v: v == "regular") (builtins.readDir dir));
  };
in {
  inherit utils;
}
