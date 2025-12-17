{
  lib,
  hostsPath,
  pkgs,
  config,
  user,
  ...
}: let
  port = lib.toIntBase10 (builtins.readFile (hostsPath "common/secrets/openssh-port.secret"));
  x280-key-file = pkgs.writeText "x280.pub" (builtins.readFile (hostsPath "keys/x280.pub"));
  main-key-file = pkgs.writeText "main.pub" (builtins.readFile (hostsPath "keys/main.pub"));
in {
  # sops.secrets = {
  #   "openssh-port" = {
  #     owner = config.users.users.${user}.name;
  #     inherit (config.users.users.${user}) group;
  #   };
  # };
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    ports = [
      port
    ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [user];
    };
    authorizedKeysFiles = [
      "${x280-key-file}"
      "${main-key-file}"
    ];
  };
  users.users.${user}.openssh.authorizedKeys.keyFiles = [
    x280-key-file
    main-key-file
  ];
  services.fail2ban.enable = true;
}
