{inputs, ...}: {
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";

    alacritty.enable = true;
    btop.enable = true;
    chromium.enable = true;
    element-desktop.enable = true;
    firefox.enable = true;
    foot.enable = true;
    fzf.enable = true;
    mangohud.enable = true;
    mpv.enable = true;
    nvim.enable = true;
    obs.enable = true;
    rofi.enable = true;
    tmux.enable = true;
    vesktop.enable = false;
    vscode.profiles.default.enable = true;
    zsh-syntax-highlighting.enable = true;
    cursors.enable = false;
  };
}
