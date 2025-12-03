{
  pkgs,
  setValueForUsers,
  ...
}: {
  programs.bash.interactiveShellInit = builtins.readFile (
    pkgs.replaceVars ./startFish.sh {
      ps = "${pkgs.procps}/bin/ps";
      fish = "${pkgs.fish}/bin/fish";
    }
  );
  home-manager.users = setValueForUsers {
    programs.fish = {
      enable = true;
      interactiveShellInit = "clear;fastfetch";
    };
  };
}
