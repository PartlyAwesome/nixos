{
  lib,
  pkgs,
  ...
}: {
  environment.variables.OBS_VKCAPTURE = "1";
  hm.programs.obs-studio = {
    enable = true;
    package = with pkgs; (
      obs-studio.override (lib.utils.enableList [
        "cudaSupport"
        "decklinkSupport"
      ])
    );
    plugins = with pkgs.obs-studio-plugins; [
      (advanced-scene-switcher.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [pkgs.cudaPackages.cudatoolkit];
      }))
      distroav
      droidcam-obs
      obs-3d-effect
      obs-advanced-masks
      obs-aitum-multistream
      obs-backgroundremoval
      obs-browser-transition
      obs-command-source
      obs-composite-blur
      obs-dir-watch-media
      (obs-dvd-screensaver.overrideAttrs (old: {
        env.NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";
      }))
      obs-freeze-filter
      obs-gradient-source
      obs-gstreamer
      input-overlay
      obs-livesplit-one
      obs-markdown
      (obs-move-transition.overrideAttrs (old: {
        env.NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";
      }))
      obs-multi-rtmp
      obs-mute-filter
      obs-noise
      obs-pipewire-audio-capture
      obs-plugin-countdown
      obs-recursion-effect
      (obs-replay-source.overrideAttrs (old: {
        env.NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";
      }))
      obs-retro-effects
      obs-rgb-levels
      obs-scale-to-sound
      obs-scene-as-transition
      (obs-shaderfilter.overrideAttrs (old: {
        env.NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";
      }))
      obs-source-clone
      obs-source-record
      (obs-source-switcher.overrideAttrs (old: {
        env.NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";
      }))
      obs-stroke-glow-shadow
      obs-teleport
      obs-text-pthread
      obs-transition-table
      obs-tuna
      obs-vaapi
      obs-vertical-canvas
      obs-vintage-filter
      obs-vkcapture
      obs-vnc
      obs-websocket
      pixel-art
      waveform
      wlrobs
    ];
  };
}
