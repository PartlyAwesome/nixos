{nixpkgs, ...} @ inputs: let
  inherit (builtins) attrNames readDir head;
  inherit (lib) nixosSystem flatten genAttrs path;
  inherit (lib.modules) importApply;
  lib = nixpkgs.lib.extend (import ./utils.nix);
  hosts = attrNames (readDir ./sys);
  user = "hayley";
  system = head lib.systems.flakeExposed;
  setupHost = host: modules:
    nixosSystem {
      specialArgs = {
        inherit inputs lib;
      };
      inherit system;
      modules = flatten modules;
    };
  userModule = ./users/${user}.nix;
  homeModule = host:
    importApply ./homeModule.nix {
      inherit user;
      modules = [
        ./sys/${host}/home
      ];
    };
  hostModules = host: map (path.append ./.) (import ./sys/${host}/modules.nix);
in
  genAttrs hosts (
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
        (hostModules host)
        (homeModule host)
        userModule
      ]
  )
