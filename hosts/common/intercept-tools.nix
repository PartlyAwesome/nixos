{pkgs, ...}: {
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
    keyboards = [
      "AT Translated Set 2 keyboard"
      "Keychron K8 Keychron K8"
    ];
    job = "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE";
    createConfigs = map (name: {
      JOB = job;
      DEVICE = {
        NAME = name;
        EVENTS = {
          EV_KEY = [
            (builtins.attrValues keyMappings)
          ];
        };
      };
    });
  in {
    enable = true;
    plugins = with pkgs.interception-tools-plugins; [
      dual-function-keys
    ];
    udevmonConfig = builtins.toJSON (createConfigs keyboards);
  };
}
