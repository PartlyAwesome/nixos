{
  config,
  inputs,
  ...
}:

{
  imports = with inputs; [
    zen-browser.homeModules.default
  ];

  programs.zen-browser.enable = true;
}
