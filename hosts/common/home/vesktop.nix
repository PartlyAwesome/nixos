{
  config,
  ...
}:

{
  programs.vesktop = {
    enable = true;
    vencord = {
      themes = {
        catppuccin = ./catt+fixes.css;
      };
      settings.enabledThemes = [ "catppuccin.css" ];
    };
  };
}
