{ config, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "pink";

    tty.enable = true;
    sddm.enable = true;
  };
}
