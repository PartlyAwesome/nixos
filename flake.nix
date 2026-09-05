{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:flox/nixpkgs/unstable"; # cuda binaries require this
    # nixpkgs-patcher.url = "github:gepbird/nixpkgs-patcher";
    # nixpkgs-patch-onnxruntime-fix-1 = {
    #   url = "https://github.com/NixOS/nixpkgs/pull/545542.diff";
    #   flake = false;
    # };
    # nixpkgs-patch-onnxruntime-fix-2 = {
    #   url = "https://github.com/NixOS/nixpkgs/pull/547077.diff";
    #   flake = false;
    # };
    # nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";
    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";
    # apollo-flake.url = "github:zhuher/le-apollo-flake-fork";
    # apollo-flake.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    nixcord.url = "github:4evy/nixcord";
    cachyos.url = "github:xddxdd/nix-cachyos-kernel/release";
    xremap-flake.url = "github:xremap/nix-flake";
    mixid.url = "github:leguteape/MixiD?dir=Nix";
    mixid.inputs.nixpkgs.follows = "nixpkgs";
    posy-cursor.url = "github:Morxemplum/posys-cursor-scalable";
    posy-cursor.inputs.nixpkgs.follows = "nixpkgs";
    nixos-core.url = "github:feel-co/nixos-core";
    nixos-core.inputs.nixpkgs.follows = "nixpkgs";
    # lix.url = "github:feel-co/netflix";
    lix.url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
    lix.flake = false;
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = import ./hosts inputs;
    keys = import ./hosts/keys;
    utils = import ./hosts/utils.nix nixpkgs.lib;
  };
}
