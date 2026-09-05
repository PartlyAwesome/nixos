{
  inputs,
  config,
  ...
}: let
  inherit (inputs.self) keys;
in {
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [config.user.name];
      GatewayPorts = "yes";
    };
    authorizedKeysFiles = map builtins.toString keys.pub-keys;
  };
  user.openssh.authorizedKeys.keyFiles = keys.pub-keys;
  services.fail2ban.enable = true;
}
