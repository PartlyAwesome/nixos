{nixpkgs, ...} @ inputs: let
  lib = nixpkgs.lib;
  hosts = builtins.attrNames (builtins.readDir ./sys);
  user = "hayley";
  system = "x86_64-linux";
  setupHost = host: modules:
    lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      system = system;
      modules = lib.flatten modules;
    };
in
  lib.genAttrs hosts (
    host:
      setupHost host
      [
        inputs.nixprv.nixosModules.default
        ./keys
        ./common
        {
          networking.hostName = host;
        }
        ./sys/${host}
        (map (lib.path.append ./.) (import ./sys/${host}/modules.nix))
        (import ./homeModule.nix {
          user = user;
          modules = [
            ./sys/${host}/home
          ];
        })
        ./users/${user}.nix
      ]
  )
