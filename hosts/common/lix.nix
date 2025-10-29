{ config, pkgs, ... }:

{
  nixpkgs.overlays = [ (final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena;
  }) ];

  nix.package = pkgs.lixPackageSets.stable.lix;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    #download-buffer-size = 524288000; not on lix
  };

  nixpkgs.config.allowUnfree = true;
}
