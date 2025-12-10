{nixpkgs, ...} @ inputs: let
  lib = nixpkgs.lib;
  hostsPath = lib.path.append ./.;
  hosts = builtins.attrNames (builtins.readDir ./sys);
  optionally = path: lib.optional (builtins.pathExists path) path;
  setValueForUsers = value: (builtins.listToAttrs (
    map (user: {
      name = "${user}";
      value = value;
    })
    users
  ));
  users = [
    "hayley"
  ];
  system = "x86_64-linux";
in {
  nixosConfigurations = builtins.listToAttrs (
    map (host: {
      name = "nixos-${host}";
      value = lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            hostsPath
            optionally
            setValueForUsers
            users
            host
            system
            ;
        };
        system = system;
        modules = [
          ./sys/${host}
        ];
      };
    })
    hosts
  );
}
