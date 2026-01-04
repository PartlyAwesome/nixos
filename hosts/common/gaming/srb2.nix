{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    srb2
  ];
}
