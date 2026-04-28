{lib, ...}: let
  inherit (lib) mkOption types;
  listOfStr = types.listOf types.str;
in {
  options.nix.subs = {
    urls = mkOption {
      type = listOfStr;
      description = "list of substituter urls";
    };
    keys = mkOption {
      type = listOfStr;
      description = "list of substituter keys";
    };
  };
  options.host.hardware = {
    ramsize = mkOption {
      type = types.int;
      description = "ram size in GB";
      readOnly = true;
    };
  };
}
