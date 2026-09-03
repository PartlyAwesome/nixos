{pkgs, ...}: {
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
    extest.enable = true;
    dedicatedServer.openFirewall = true;
  };
}
