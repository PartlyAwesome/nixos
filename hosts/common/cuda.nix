{
  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.allowUnfreePredicate = p:
    builtins.all (
      license:
        license.free
        || builtins.elem license.shortName [
          "CUDA EULA"
          "cuDNN EULA"
          "cuTENSOR EULA"
          "NVidia OptiX EULA"
        ]
    ) (
      if builtins.isList p.meta.license
      then p.meta.license
      else [p.meta.license]
    );
  nix.subs.urls = [
    "https://cache.nixos-cuda.org"
    "https://cache.flox.dev"
  ];
  nix.subs.keys = [
    "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
  ];
}
