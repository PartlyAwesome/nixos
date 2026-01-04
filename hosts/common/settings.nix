{
  nix.settings = {
    auto-optimise-store = true;
    trusted-users = ["@wheel"];
  };
}
