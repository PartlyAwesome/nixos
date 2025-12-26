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
      modules = lib.flatten modules;
    };
  };
in
  builtins.listToAttrs (
    map (
      host:
        setupHost host
        [
          inputs.nixprv.nixosModules.default
          ./keys
          ./common
          ./sys/${host}
          (map (lib.path.append ./.) (import ./sys/${host}/modules.nix))
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
