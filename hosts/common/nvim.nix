{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = with inputs; [
    nvf.nixosModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    viAlias = true;
    vimAlias = true;

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    lazy.plugins = {
      "guess-indent.nvim" = {
        package = pkgs.vimPlugins.guess-indent-nvim;
        setupModule = "guess-indent";
        setupOpts = {
          auto_cmd = true;
          override_editorconfig = true;
        };
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    languages = {
      enableDAP = true;
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      ts.enable = true;
      rust.enable = true;
    };
  };
}
