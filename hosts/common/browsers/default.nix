{lib, ...}: {
  imports = lib.utils.dirFiles ./enabled;
}
