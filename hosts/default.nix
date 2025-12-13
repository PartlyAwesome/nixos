{nixpkgs, ...} @ inputs: let
  lib = nixpkgs.lib;
  hostsPath = lib.path.append ./.;
  hosts = builtins.attrNames (builtins.readDir ./sys);
  user = "hayley";
  system = "x86_64-linux";
  setupHost = host: modules: {
    name = "nixos-${host}";
    value = lib.nixosSystem {
      specialArgs = {
        inherit inputs hostsPath user system;
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
          ./sys/${host}
          (import ./homeModule.nix {
            host = host;
            user = user;
          })
          ./users/${user}.nix
        ]
    )
    hosts
  )
