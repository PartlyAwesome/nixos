{inputs, ...}: let
  defaults = {
    enable = true;
    autoEnable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";
  };
in {
  imports = [inputs.catppuccin.nixosModules.default];
  hm.imports = [inputs.catppuccin.homeModules.catppuccin];
  catppuccin = defaults;
  hm.catppuccin =
    defaults
    // {
      vesktop.enable = false;
      cursors.enable = false;
    };
}
