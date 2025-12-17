{
  inputs,
  pkgs,
  ...
}: {
  # imports = [inputs.sops-nix.nixosModules.sops];
  # sops = {
  #   defaultSopsFile = ./secrets.yaml;
  #   validateSopsFiles = false;
  #   age.keyFile = "~/.config/sops/age/key.txt";
  #   secrets = {
  #     openssh-port = {};
  #   };
  # };
  environment.systemPackages = with pkgs; [
    age
    sops
    git-agecrypt
  ];
}
