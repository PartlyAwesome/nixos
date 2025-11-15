{
  config,
  pkgs,
  ...
}: {
  # probably unnecessary?
  hardware.uinput.enable = true;

  services.interception-tools = let
    keyMappings = {
      KEY = "KEY_CAPSLOCK";
      TAP = "KEY_ESC";
      HOLD = "KEY_LEFTMETA";
    };
    dfkConfig = pkgs.writeText "dual-function-keys.yaml" (builtins.toJSON {
      MAPPINGS = [
        (keyMappings // {HOLD_START = "BEFORE_CONSUME";})
      ];
    });
  in {
    enable = true;
    plugins = with pkgs.interception-tools-plugins; [
      dual-function-keys
    ];
    udevmonConfig = builtins.toJSON [
      {
        JOB = "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE";
        # device names can be found by doing:
        # enter interception-tools shell: nix-shell -p interception-tools
        # run: sudo uinput -p -d /dev/input/by-id/[TAB]
        DEVICE = {
          NAME = "Keychron K8 Keychron K8";
          EVENTS = {
            EV_KEY = [
              (builtins.attrValues keyMappings)
            ];
          };
        };
      }
    ];
  };
}
