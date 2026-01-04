{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.default
  ];
  catppuccin = {
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";
  };
}
