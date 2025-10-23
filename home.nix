{ config, pkgs, ... }:

{
  home.username = "hayley";
  home.homeDirectory = "/home/hayley";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    chromium
    #jellyfin-media-player
    wget
    unzip
    obs-studio
    gimp
    nurl
    catppuccin-kde
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  programs.alacritty = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  programs.zen-browser = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Hayley Sparham";
      user.email = "hayley@partlyaweso.me";
    };

    lfs.enable = true;
  };

  catppuccin = {
    enable = true;
    cache.enable = true;
    flavor = "mocha";
    accent = "pink";

    # tty.enable = true;
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
  };

  home.stateVersion = "25.05";
}
