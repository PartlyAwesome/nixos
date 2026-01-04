{
  inputs,
  pkgs,
  ...
}: {
  # imports = [
  #   (inputs.apollo-flake.nixosModules.${system}.default)
  #   ({pkgs, ...}: {
  #     services.apollo.package = inputs.apollo-flake.packages.${system}.default;
  #   })
  # ];
  imports = [
    # https://github.com/nil-andreas/apollo-flake/blob/4c191a1aae15bdef4874a1bace5145bd4a569842/flake.nix#L253
    "${inputs.apollo-flake}/apollo-module.nix"
  ];

  services.apollo = {
    package = inputs.apollo-flake.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
