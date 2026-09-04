{
  inputs,
  lib,
  pkgs,
  ...
}: let
  writeTOML = (pkgs.formats.toml {}).generate; # for the love of god move this to somewhere else.
  groupNames = ["auto-hlsearch" "fuck-git"];
  createAugroup = name: {
    inherit name;
    clear = true;
  };
  augroups = builtins.map createAugroup groupNames;
  groups = lib.genAttrs groupNames (x: x);
in {
  imports = with inputs; [
    nvf.nixosModules.default
  ];

  environment.variables.EDITOR = "nvim";
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    viAlias = true;
    vimAlias = true;

    searchCase = "smart";

    statusline.lualine.enable = true;
    telescope.enable = true;
    undoFile.enable = true;
    comments.comment-nvim.enable = true;
    fzf-lua.enable = true;
    notes.obsidian.enable = true;
    notes.todo-comments.enable = true;
    visuals.blink-indent.enable = true;

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
    };

    inherit augroups;
    autocmds = with groups; [
      {
        desc = "get rid of the stupid highlight";
        event = ["CursorMoved"];
        group = auto-hlsearch;
        callback = lib.mkLuaInline ''
          function ()
            if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
              vim.schedule(function () vim.cmd.nohlsearch() end)
            end
          end
        '';
      }
      {
        desc = "disable git commit message word wrap";
        event = ["FileType"];
        pattern = ["gitcommit"];
        group = fuck-git;
        command = "setlocal textwidth=0";
      }
    ];

    git = {
      enable = true;
      neogit.enable = true;
    };

    autocomplete.blink-cmp = {
      enable = true;
    };

    mini = {
      ai.enable = true;
      cmdline.enable = true;
      icons.enable = true;
      map.enable = true;
      move.enable = true;
      splitjoin.enable = true;
      surround.enable = true;
      tabline.enable = true;
      trailspace.enable = true;
      visits.enable = true;
    };

    # scrolling
    options = {
      scrolloff = 8;
    };
    mini.animate = {
      enable = true;
      setupOpts = {
        cursor.enable = false;
        resize.enable = false;
        open.enable = false;
        close.enable = false;
        scroll = {
          enable = true;
          timing = lib.mkLuaInline "require('mini.animate').gen_timing.quadratic({duration=25,unit='total'})";
          subscroll = lib.mkLuaInline "require('mini.animate').gen_subscroll.equal({max_output_steps=30})";
        };
      };
    };

    # folding
    options = {
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
    ui.nvim-ufo.enable = true;

    # file explorer
    utility.oil-nvim = {
      enable = true;
      gitStatus.enable = true;
    };
    keymaps = [
      {
        key = "-";
        mode = "n";
        action = "<CMD>Oil<CR>";
        desc = "Open Oil";
      }
    ];

    ui.nvim-highlight-colors = {
      enable = true;
      setupOpts = {
        enable_named_colors = false;
        enable_tailwind = true;
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    languages = {
      enableDAP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      angular.enable = true;
      arduino.enable = true;
      asciidoc.enable = true;
      assembly.enable = true;
      astro.enable = true;
      awk.enable = true;
      bash.enable = true;
      clang.enable = true;
      clojure.enable = true;
      cmake.enable = true;
      # csharp.enable = true; # disabled because other dependencies are required
      css.enable = true;
      # dart disabled because nvf needs to update their implementation otherwise we get a warning!
      # dart = {
      #   enable = true;
      #   flutter-tools.enable = true;
      # };
      docker.enable = true;
      elixir = {
        enable = true;
        elixir-tools.enable = true;
      };
      env.enable = true;
      fish.enable = true;
      gleam.enable = true;
      glsl.enable = true;
      go = {
        enable = true;
        extensions.gopher-nvim.enable = true;
      };
      haskell = {
        enable = true;
        lsp.enable = false; # managed by haskell-tools
        extensions.haskell-tools.enable = true;
      };
      html.enable = true;
      http.enable = true;
      json.enable = true;
      json5.enable = true;
      just.enable = true;
      lua.enable = true;
      make.enable = true;
      markdown.enable = true;
      nix.enable = true;
      nu.enable = true;
      odin.enable = true;
      python.enable = true;
      qml.enable = true;
      rust = {
        enable = true;
        lsp.enable = false; # managed by rustaceanvim
        dap.enable = false; # managed by rustaceanvim
        extensions = {
          crates-nvim.enable = true;
          rustaceanvim.enable = true;
        };
      };
      scss.enable = true;
      sql = {
        enable = true;
        extensions.sqls-nvim.enable = true;
      };
      svelte.enable = true;
      terraform.enable = true;
      tex.enable = true;
      toml.enable = true;
      tsx.enable = true;
      typescript = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      typst = {
        enable = true;
        extensions.typst-preview-nvim.enable = true;
      };
      vue.enable = true;
      wgsl.enable = true;
      xml.enable = true;
      yaml.enable = true;
      zig.enable = true;
      zsh.enable = true;
    };

    diagnostics = {
      enable = true;
      nvim-lint.enable = true;
      presets = {
        deadnix.enable = true;
        dotenv-linter.enable = true;
        eslint_d.enable = true;
        golangci-lint.enable = true;
        htmlhint.enable = true;
        mypy.enable = true;
        rumdl.enable = true;
        selene.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
        stylelint.enable = true;
        tombi.enable = true;
      };
      nvim-lint.linters.statix = let
        config = writeTOML "statix.toml" {
          disabled = ["repeated_keys"];
        };
      in {
        args = ["--config ${config}"];
      };
    };

    binds = {
      cheatsheet.enable = true;
      hardtime-nvim.enable = true;
      whichKey.enable = true;
    };

    utility = {
      csvview.enable = true;
      diffview-nvim.enable = true;
      direnv.enable = true;
      mkdir.enable = true;
      nix-develop.enable = true;
      # qmk-nvim.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;
      # vim-wakatime.enable = true;
      motion = {
        precognition = {
          enable = true;
          setupOpts = {
            targetedMotionHints.enabled = false;
          };
        };
        flash-nvim.enable = true;
      };
    };

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
  };
}
