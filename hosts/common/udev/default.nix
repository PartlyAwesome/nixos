{lib, ...}: let
  inherit (builtins) attrNames readDir readFile filter;
  inherit (lib) genAttrs hasSuffix path;
in {
  imports = [./udev-rules-option.nix];

  services.udev.rules = genAttrs (
    filter (filename: hasSuffix ".rules" filename) (attrNames (readDir ./.))
  ) (name: readFile (path.append ./. name));
}
