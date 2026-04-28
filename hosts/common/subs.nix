{config, ...}: let
  defaultSubstituters = [
    "https://nix-community.cachix.org"
    "https://colmena.cachix.org"
    "https://cache.nixos-cuda.org"
    "https://cache.garnix.io"
    "https://attic.xuyh0120.win/lantian"
  ];
  defaultKeys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
    "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
  ];
in {
  nix.subs.urls = defaultSubstituters;
  nix.subs.keys = defaultKeys;
  nix.settings = {
    extra-substituters = config.nix.subs.urls;
    extra-trusted-substituters = config.nix.subs.urls;
    extra-trusted-public-keys = config.nix.subs.keys;
  };
}
