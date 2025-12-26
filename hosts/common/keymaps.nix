{
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.host-options.keymap == config.host-options.keymaps.asus) {
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    })
    (lib.mkIf (config.host-options.keymap == config.host-options.keymaps.uk) {
      services.xserver.xkb = {
        layout = "gb";
        variant = "";
      };

      console.keyMap = "uk";
    })
  ];
}
