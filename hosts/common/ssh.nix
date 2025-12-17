{
  config,
  user,
  ...
}: {
  # sops.secrets = {
  #   "openssh-port" = {
  #     owner = config.users.users.${user}.name;
  #     inherit (config.users.users.${user}) group;
  #   };
  # };
  programs.ssh.startAgent = true;
  # services.openssh = {
  #   enable = true;
  #   ports = [
  #     (builtins.readFile config.sops.secrets."openssh-port".path)
  #   ];
  #   settings = {
  #     PasswordAuthentication = false;
  #     KbdInteractiveAuthentication = false;
  #     PermitRootLogin = "no";
  #     AllowUsers = [user];
  #   };
  # };
  # services.fail2ban.enable = true;
}
