{ config, osConfig, ... }:
{
  osConfig.programs.bash.interactiveShellInit = builtins.readFile ./startFish.sh;
  programs.fish = {
    enable = true;
    interactiveShellInit = "clear;fastfetch";
  };
}
