{
  config,
  inputs,
  pkgs,
  system,
  ...
}: {
  imports = [
    (inputs.apollo-flake.nixosModules.${system}.default)
    ({pkgs, ...}: {
      services.apollo.package = inputs.apollo-flake.packages.${system}.default;
    })
  ];

  services.apollo = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
