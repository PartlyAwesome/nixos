{
  lib,
  config,
  pkgs,
  ...
}:
let
  ps = lib.getExe' pkgs.procps "ps";
  fish = lib.getExe pkgs.fish;

  interactiveShellInit = ''
      if [[ $(${ps} --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${fish} $LOGIN_OPTION
    fi

  '';
in
{
  programs.bash = {
    inherit interactiveShellInit;
  };
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
    ytdl = "yt-dlp";
  };
}
