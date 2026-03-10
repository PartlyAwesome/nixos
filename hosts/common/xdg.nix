{config, ...}: let
  h = config.user.home;
in {
  hm = {
    home.preferXdgDirectories = true;
    xdg.enable = true;
    xdg.userDirs = {
      enable = true;
      createDirectories = true;

      /*
      default names are too long and have yucky capitalism
      */
      download = h + "/dl"; # why doesnt this have an s at the end??
      documents = h + "/doc";
      music = h + "/music";
      pictures = h + "/pic";
      videos = h + "/vid";

      /*
      dont need
      */
      publicShare = null;
      templates = null;
      desktop = null;

      extraConfig = {
        GAMES = h + "/games";
        MISC = h + "/misc";
      };
    };
  };
}
