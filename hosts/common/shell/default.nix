{
  config,
  pkgs,
  user,
  ...
}: {
  programs.bash.interactiveShellInit = builtins.readFile (
    pkgs.replaceVars ./startFish.sh {
      ps = "${pkgs.procps}/bin/ps";
      fish = "${pkgs.fish}/bin/fish";
    }
  );
  home-manager.users.${user} = {
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
  };
}
