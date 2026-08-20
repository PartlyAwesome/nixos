{
  programs.direnv = {
    enable = true;
    angrr = {
      enable = true;
      autoUse = true;
    };
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    loadInNixShell = true;
  };

  services.angrr = {
    enable = true;
    settings.profile-policies = {
      system = {
        profile-paths = ["/nix/var/nix/profiles/system"];
        keep-latest-n = 20;
        keep-current-system = true;
        keep-booted-system = true;
      };
    };
  };
}
