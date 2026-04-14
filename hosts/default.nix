{nixpkgs, ...} @ inputs: let
  lib = nixpkgs.lib.extend (import ./utils.nix);
  hosts = builtins.attrNames (builtins.readDir ./sys);
  user = "hayley";
  system = "x86_64-linux";
  setupHost = host: modules:
    lib.nixosSystem {
      specialArgs = {
        inherit inputs lib;
      };
      inherit system;
      modules = lib.flatten modules;
    };
in
  lib.genAttrs hosts (
    host:
      setupHost host
      [
        inputs.nixprv.nixosModules.default
        ./options.nix
        ./keys
        ./common
        {
          networking.hostName = host;
        }
        ./sys/${host}
        (map (lib.path.append ./.) (import ./sys/${host}/modules.nix))
        (lib.modules.importApply ./homeModule.nix {
          inherit user;
          modules = [
            ./sys/${host}/home
          ];
        })
        ./users/${user}.nix
      ]
  )
