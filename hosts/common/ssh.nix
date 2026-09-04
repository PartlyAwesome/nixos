{
  inputs,
  config,
  ...
}: {
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    # ports = [
    #   config.secrets.sshPort
    # ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [config.user.name];
      GatewayPorts = "yes";
    };
    authorizedKeysFiles = map builtins.toString inputs.self.keys.pub-keys;
  };
  user.openssh.authorizedKeys.keyFiles = inputs.self.keys.pub-keys;
  services.fail2ban.enable = true;
}
