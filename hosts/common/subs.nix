{config, ...}: let
  defaultSubstituters = [
    "https://nix-community.cachix.org"
    "https://colmena.cachix.org"
  ];
  defaultKeys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
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
