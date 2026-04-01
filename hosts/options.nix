{lib, ...}: {
  options.host = {
    hardware = {
      ramsize = lib.mkOption {
        type = lib.types.int;
        description = "ram size in GB";
        readOnly = true;
      };
    };
  };
}
