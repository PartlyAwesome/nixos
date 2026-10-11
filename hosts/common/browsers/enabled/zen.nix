{inputs, ...}: {
  hm.imports = [inputs.zen-browser.homeModules.default];

  hm.programs.zen-browser = {
    enable = true;
    profiles.default.presets.catppuccin = {
      enable = true;
      flavor = "Mocha";
      accent = "Pink";
    };
  };
}
