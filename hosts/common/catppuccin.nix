{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.default
  ];
  catppuccin = {
    sources.palette = inputs.catppuccin-palette;
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";
  };
}
