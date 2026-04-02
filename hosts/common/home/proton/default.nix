{pkgs, ...}: {
  home.packages = with pkgs; [
    proton-vpn
    proton-pass
    proton-authenticator
    protonmail-desktop
  ];
}
