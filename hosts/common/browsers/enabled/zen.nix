{inputs, ...}: {
  hm.imports = [inputs.zen-browser.homeModules.default];

  hm.programs.zen-browser.enable = true;
}
