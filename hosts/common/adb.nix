{pkgs, ...}: {
  user.extraGroups = ["adbusers"];
  home-pkgs = with pkgs; [
    android-tools
  ];
}
