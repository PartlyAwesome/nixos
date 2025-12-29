let
  substituters = [
    "https://nix-community.cachix.org"
    "https://colmena.cachix.org"
    "https://cache.nixos-cuda.org"
  ];
  keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
    "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
  ];
in {
  nix.settings = {
    extra-substituters = substituters;
    extra-trusted-substituters = substituters;
    extra-trusted-public-keys = keys;
  };
}
