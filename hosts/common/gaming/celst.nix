{
  config,
  pkgs,
  ...
}: let
  celesteDir = config.hm.xdg.userDirs.extraConfig.GAMES + "/celeste";
  gameDir = celesteDir + "/game";
  everestDir = celesteDir + "/everest";
in {
  home-pkgs = with pkgs; [
    (
      (celestegame.overrideAttrs (_: {
        env = {
          NIX_ITCHIO_API_KEY = "insert_key_here";
        };
      })).override {
        withEverest = true;
        gameDir = gameDir;
        writableDir = everestDir;
        overrideSrc = pkgs.requireFile {
          name = "celeste-linux.zip";
          sha256 = "a613430411dbef3c0c45a0474f90f4845122964c7d177d69e88965bcb84741bf";
          url = "https://maddymakesgamesinc.itch.io/celeste";
        };
      }
    )
    (olympus.override {finderHints = gameDir;})
  ];
}
