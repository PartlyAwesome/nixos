{inputs, ...}: {
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";

    vesktop.enable = false;
    cursors.enable = false;
  };
}
