{...}: {
  xdg.terminal-exec = {
    enable = true;
    settings.default = [
      "Alacritty.desktop"
    ];
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "Alacritty.desktop";
    };
  };
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 70;
        columns = 250;
      };
      font.offset = {
        x = 0;
        y = -3;
      };
    };
  };
}
