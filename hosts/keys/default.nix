{
  config,
  lib,
  pkgs,
  ...
}: let
  getKeyFile = name: pkgs.writeText "${name}.pub" (builtins.readFile ./${name}.pub);
in {
  options.keys = {
    x280 = lib.mkOption {
      type = lib.types.path;
      default = getKeyFile "x280";
      readOnly = true;
    };
    main = lib.mkOption {
      type = lib.types.path;
      default = getKeyFile "main";
      readOnly = true;
    };
    pub-keys = lib.mkOption {
      type = lib.types.listOf lib.types.path;
      default = [
        config.keys.x280
        config.keys.main
      ];
      readOnly = true;
    };
  };
}
