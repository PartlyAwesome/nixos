{
  config,
  inputs,
  pkgs,
  ...
}: let
  pkgs_small = import inputs.nixpkgs-small {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
in {
  _module.args.pkgs_small = pkgs_small;
  hm._module.args.pkgs_small = pkgs_small;
}
