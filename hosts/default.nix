{nixpkgs, ...} @ inputs: let
  lib = nixpkgs.lib;
  hosts = builtins.attrNames (builtins.readDir ./sys);
  user = "hayley";
  system = "x86_64-linux";
  setupHost = host: modules: {
    name = "nixos-${host}";
    value = lib.nixosSystem {
      specialArgs = {
        inherit inputs user;
      };
      system = system;
      modules = modules;
    };
  };
in
  builtins.listToAttrs (
    map (
      host:
        setupHost host
        [
          inputs.nixprv.nixosModules.default
          ./utils.nix
          ./options.nix
          ./keys
          ./common
          ./sys/${host}
          (import ./homeModule.nix {
            modules = [
              ./sys/${host}/home
            ];
          })
          ./users/${user}.nix
        ]
    )
    hosts
  )
