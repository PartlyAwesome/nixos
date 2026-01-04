{pkgs, ...}: {
  home.packages = with pkgs; [
    yq-go
    prettier
  ];
  programs.bat = {
    enable = true;
    extraPackages = [
      pkgs.bat-extras.core
    ];
  };
}
