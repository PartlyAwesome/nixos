{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    crossmacro
  ];
}
