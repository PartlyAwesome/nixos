{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://colmena.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-jelly.url = "github:picnoir/nixpkgs/pic/jellyfin-qt6";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";
    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";
    apollo-flake.url = "github:nil-andreas/apollo-flake";
    nvf.url = "github:NotAShelf/nvf/v0.8";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    nixcord.url = "github:FlameFlag/nixcord";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    lib = nixpkgs.lib;
    hostsPath = lib.path.append ./hosts;
    hosts = builtins.attrNames (builtins.readDir (hostsPath "sys"));
    optionally = path: lib.optional (builtins.pathExists path) path;
    user = "hayley";
    system = "x86_64-linux";
    setupHomeManager = path: {
      extraSpecialArgs = {
        inherit
          inputs
          hostsPath
          system
          ;
      };
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bkp";
      users.${user}.imports = [path (hostsPath "common/home")];
    };
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
              user
              host
              system
              setupHomeManager
              ;
          };
          system = system;
          modules = [
            (hostsPath "sys/${host}")
          ];
        };
      })
      hosts
    );
  };
}
