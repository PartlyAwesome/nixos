{
  config,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 70;
        columns = 250;
      };
    };
  };
}
