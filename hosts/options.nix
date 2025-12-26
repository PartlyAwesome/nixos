{
  config,
  lib,
  ...
}: {
  options.host-options = {
    apollo.enable = lib.mkEnableOption "apollo";
    gaming.enable = lib.mkEnableOption "gaming";
    laptop.enable = lib.mkEnableOption "laptop";
    keymaps = lib.mkOption {
      type = lib.types.attrs;
      default = {
        uk = "uk";
        asus = "asus";
      };
      description = "available keymaps";
      readOnly = true;
    };
    keymap = lib.mkOption {
      type = lib.types.enum (builtins.attrValues config.hosts-options.keymaps);
      description = "keymap type for host";
    };
  };
}
