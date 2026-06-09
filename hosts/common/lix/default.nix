{
  inputs,
  lib,
  pkgs,
  ...
}: let
  lixVersionJson = builtins.fromJSON (builtins.readFile (inputs.lix + "/version.json"));
  versionSuffix = with inputs;
    lib.optionalString (!lixVersionJson.official_release)
    "-pre${builtins.substring 0 8 lix.lastModifiedDate or lix.lastModified or "19700101"}-dev_${lix.shortRev or lix.dirtyShortRev or "dirty"}-raf-patched";
in {
  imports = [
    (lib.modules.importApply "${inputs.lix-module}/nixos-module.nix" {
      inherit versionSuffix;
      lix = pkgs.applyPatches {
        name = "rafware-lix";
        src = inputs.lix;
        patches = [
          ./0001-bindings-linear-search-small-sets.patch
          ./0002-primops-o1-tail-share-elems.patch
        ];
      };
    })
  ];

  documentation.nixos.enable = false;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    connect-timeout = 30;
    min-free = 128000000;
    max-free = 1000000000;
    auto-optimise-store = true;
    narinfo-cache-negative-ttl = 0;
  };

  nixpkgs.config.allowUnfree = true;
}
