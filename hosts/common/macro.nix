{pkgs, ...}: {
  user.extraGroups = ["input"];
  home-pkgs = with pkgs; [
    crossmacro
  ];
}
