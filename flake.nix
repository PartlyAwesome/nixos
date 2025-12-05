{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://colmena.cachix.org"
      "https://chaotic-nyx.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-jelly.url = "github:picnoir/nixpkgs/pic/jellyfin-qt6";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
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
            (hostsPath "sys/${host}")
          ];
        };
      })
      hosts
    );
  };
}
