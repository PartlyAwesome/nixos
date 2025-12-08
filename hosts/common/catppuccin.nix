{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.default
  ];
  catppuccin = {
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";

    tty.enable = true;
    sddm.enable = true;
  };
}
