{
  config,
  user,
  ...
}: {
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    ports = [
      config.secrets.sshPort
    ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [user];
    };
    authorizedKeysFiles = config.keys.pub-keys;
  };
  users.users.${user}.openssh.authorizedKeys.keyFiles = config.keys.pub-keys;
  services.fail2ban.enable = true;
}
