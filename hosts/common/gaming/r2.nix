{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.host-options.gaming.enable {
    environment.systemPackages = with pkgs; [
      r2modman
    ];
  };
}
