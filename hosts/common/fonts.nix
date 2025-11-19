{
  config,
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.roboto-mono
      roboto-flex
    ];

    fontDir.enable = true;

    fontconfig.defaultFonts = {
      sansSerif = [ "Roboto" ];
      monospace = [ "Roboto Mono" ];
    };
  };
}
