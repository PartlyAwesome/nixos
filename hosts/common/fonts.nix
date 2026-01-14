{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.roboto-mono
      roboto-flex
      roboto-serif
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];

    fontDir.enable = true;

    fontconfig.defaultFonts = {
      serif = ["Roboto Serif"];
      sansSerif = ["Roboto Flex"];
      monospace = ["RobotoMono Nerd Font"];
    };
  };
}
