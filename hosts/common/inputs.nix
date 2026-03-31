{
  lib,
  config,
  inputs,
  ...
}: let
  modes = {
    default = "default";
    gaming = "gaming";
    deadlock = "deadlock";
  };
  gaming_modes = with modes; [
    gaming
    deadlock
  ];
  keys = {
    caps = "CAPSLOCK";
    meta = "SUPER_L";
    shift = "SHIFT_L";
    ctrl = "CTRL_L";
    space = "SPACE";
    esc = "ESC";
    mouse_front = "BTN_EXTRA";
    mouse_back = "BTN_SIDE";
    shift_space = "SHIFT-SPACE";
    left_alt = "ALT_L";
    right_alt = "ALT_R";
    g = "G";
    d = "D";
  };
  combos = with keys; {
    double_alt_g = createCombo [left_alt right_alt g];
    double_alt_d = createCombo [left_alt right_alt d];
    gaming_g = createCombo [shift left_alt right_alt g];
    gaming_d = createCombo [shift left_alt right_alt d];
  };
  setMode = mode: {set_mode = mode;};
  createCombo = lib.join "-";
in {
  imports = [inputs.xremap-flake.nixosModules.default];

  # probably unnecessary?
  hardware.uinput.enable = true;

  services.xremap = {
    enable = true;
    withKDE = true;
    serviceMode = "user";
    userName = config.user.name;
    watch = true;
    mouse = true;

    config.default_mode = modes.default;
    config.modmap = with keys // modes; [
      {
        name = "caps -> esc/meta";
        remap = {
          ${caps} = {
            held = meta;
            alone = esc;
            alone_timeout_millis = 200;
          };
        };
        mode = default;
      }
      {
        name = "disable mouse side buttons";
        remap = {
          ${mouse_front} = [];
          ${mouse_back} = [];
        };
        mode = [default gaming];
      }
      {
        name = "deadlock: grounded airdash";
        remap = {
          ${mouse_front} = [];
          ${mouse_back} = [shift space];
        };
        mode = deadlock;
      }
      {
        name = "caps -> ctrl";
        remap = {
          ${caps} = ctrl;
        };
        mode = gaming_modes;
      }
    ];
    config.keymap = with combos // modes; [
      {
        name = "mode switches";
        remap = {
          ${double_alt_g} = setMode gaming;
          ${double_alt_d} = setMode default;
        };
      }
      {
        name = "game switches";
        remap = {
          ${gaming_g} = setMode gaming;
          ${gaming_d} = setMode deadlock;
        };
        mode = gaming_modes;
      }
    ];
  };
}
