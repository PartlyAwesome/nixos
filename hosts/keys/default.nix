{
  config,
  lib,
  ...
}: let
in {
  options.keys = {
    x280 = lib.mkOption {
      type = lib.types.path;
      default = ./x280.pub;
      readOnly = true;
    };
    main = lib.mkOption {
      type = lib.types.path;
      default = ./main.pub;
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
