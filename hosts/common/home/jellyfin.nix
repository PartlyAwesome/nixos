{
  inputs,
  pkgs,
  ...
}:
#let
#  ignoreVulnerabilities =
#    pkg:
#    pkg.overrideAttrs (o: {
#      meta = o.meta // {
#        knownVulnerabilities = [ ];
#      };
#    });
#in
{
  # jellyfin is currently insecure! i don't care.
  #nixpkgs.config.permittedInsecurePackages = [
  #"qtwebengine-5.15.19"
  #];

  #jmp =
  #pkgs.jellyfin-media-player.override {
  #qtwebengine = ignoreVulnerabilities pkgs."qtwebengine-5.15.19";
  #};

  home.packages =
    #with pkgs;
    [
      #jellyfin-media-player
      #jmp
      #(jellyfin-media-player.override {
      #qtwebengine = ignoreVulnerabilities pkgs.libsForQt5.qt5.qtwebengine;
      #})
      #inputs.mio-pkgs.packages.${system}.jellyfin-media-player
      inputs.nixpkgs-jelly.legacyPackages.${pkgs.stdenv.hostPlatform.system}.jellyfin-media-player
    ];
}
