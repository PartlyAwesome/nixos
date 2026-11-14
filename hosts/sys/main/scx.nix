{pkgs, ...}: let
  scheds = {
    cosmos = {
      # see: https://wiki.cachyos.org/configuration/sched-ext/#scx_cosmos
      scheduler = "scx_cosmos";
      args = [
        "-m performance"
        "-c 0"
        "-p 0"
        "-w"
      ];
    };
    cake = {
      # see: https://wiki.cachyos.org/configuration/sched-ext/#scx_cake
      # see: https://github.com/sched-ext/scx/tree/main/scheds/rust/scx_cake#5-configuration
      scheduler = "scx_cake";
      args = [];
    };
  };
  active_scheduler = scheds.cake;
in {
  services.scx-loader = {
    enable = true;
    schedsPackages = [pkgs.scx.full];
    config.default_sched = active_scheduler.scheduler;
    # extraArgs = active_scheduler.args; TODO: make this compatible with scx-loader
  };
}
