{config, ...}: {
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
      AllowUsers = [config.user.name];
    };
    authorizedKeysFiles = map builtins.toString config.keys.pub-keys;
  };
  user.openssh.authorizedKeys.keyFiles = config.keys.pub-keys;
  services.fail2ban.enable = true;
}
