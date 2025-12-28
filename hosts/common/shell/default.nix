{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.bash.interactiveShellInit = builtins.readFile (
    pkgs.replaceVars ./startFish.sh {
      ps = lib.getExe' pkgs.procps "ps";
      fish = lib.getExe pkgs.fish;
    }
  );
  hm = {
    home.shellAliases = config.environment.shellAliases;
    programs.fish = {
      enable = true;
      interactiveShellInit = "clear;fastfetch";
    };
  };
  environment.shellAliases = {
    config = "cd /etc/nixos";
    cat = "bat --paging=never";
    brg = "batgrep --paging=never";
    pb = "prettybat --paging=never";
  };
}
