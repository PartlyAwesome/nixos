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
      serif = [ "Roboto Flex" ];
      sansSerif = [ "Roboto Flex" ];
      monospace = [ "RobotoMono Nerd Font" ];
    };
  };
}
