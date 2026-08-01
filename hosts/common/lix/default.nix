{inputs, ...}: {
  imports = [inputs.lix-module.nixosModules.default];

  documentation.nixos.enable = false;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    connect-timeout = 30;
    min-free = 128000000;
    max-free = 1000000000;
    auto-optimise-store = true;
    narinfo-cache-negative-ttl = 0;
  };

  nixpkgs.config.allowUnfree = true;
}
