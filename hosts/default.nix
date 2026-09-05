{nixpkgs, ...} @ inputs: let
  inherit (nixpkgs) lib;
  inherit (builtins) attrNames readDir head;
  inherit (lib) nixosSystem flatten genAttrs path;
  inherit (lib.modules) importApply;
  hosts = attrNames (readDir ./sys);
  user = "hayley";
  system = head lib.systems.flakeExposed;
  setupHost = modules:
    nixosSystem {
      specialArgs = {
        inherit inputs;
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
      setupHost
      [
        ./options.nix
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
