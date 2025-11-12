{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    protonvpn-gui
    proton-pass
    proton-authenticator
    protonmail-desktop
  ];
}
