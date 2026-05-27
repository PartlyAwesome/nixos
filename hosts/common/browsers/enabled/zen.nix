{inputs, pkgs, ...}: {
  hm.imports = [inputs.zen-browser.homeModules.default];
  hm.programs.zen-browser = {
    unwrappedPackage = pkgs.firefox-bin-unwrapped;
    enable = true;
  };
}
