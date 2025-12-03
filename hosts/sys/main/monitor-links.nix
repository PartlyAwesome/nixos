{pkgs, ...}: {
  networking.networkmanager.dispatcherScripts = [
    {
      source =
        (pkgs.writeShellApplication {
          name = "link_change.sh";
          runtimeInputs = [pkgs.networkmanager];
          text = ''
            logger "$0" "$@"
          '';
        }).out
        + "/bin/"
        + "link_change.sh";
    }
  ];
}
