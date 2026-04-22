{
  lib,
  pkgs,
  ...
}: let
  loudmax_plugin = pkgs.runCommand "loudmax64.so" {
    nativeBuildInputs = [pkgs.autoPatchelfHook];
    buildInputs = with pkgs.stdenv.cc; [cc libc];
  } "cp ${./loudmax/loudmax64.so} $out && chmod +w $out && autoPatchelf $out";
  createAudioSink = name: {
    "context.objects" = [
      {
        factory = "adapter";
        args = {
          "factory.name" = "support.null-audio-sink";
          "node.name" = name;
          "node.description" = name;
          "media.class" = "Audio/Sink";
          "audio.position" = "FL,FR";
          "monitor.channel-volumes" = "true";
          "monitor.passthrough" = "true";
          "adapter.auto-port-config" = {
            "mode" = "dsp";
            "monitor" = "true";
            "position" = "preserve";
          };
        };
      }
    ];
  };
  createFilterChain = {
    name,
    plugin,
    label,
    control ? null,
    captureProps ? {},
    playbackProps ? {},
  }: {
    "context.modules" = [
      {
        name = "libpipewire-module-filter-chain";
        args = {
          "node.description" = name;
          "media.name" = name;
          "filter.graph" = {
            nodes = [
              {
                type = "ladspa";
                inherit name plugin label;
                control = lib.mkIf (control != null) control;
              }
            ];
          };
          "capture.props" =
            {
              "node.name" = "${name} Input";
              "node.passive" = true;
            }
            // captureProps;
          "playback.props" =
            {
              "node.name" = "${name} Output";
              "media.class" = "Audio/Source";
            }
            // playbackProps;
        };
      }
    ];
  };
  createLoudMaxNode = {
    name,
    threshold,
  }:
    createFilterChain {
      inherit name;
      plugin = loudmax_plugin;
      label = "ldmx_stereo";
      control = {
        "Threshold (dB)" = threshold;
        "Output (dB)" = 0;
      };
      captureProps = {
        "node.autoconnect" = "false";
        "audio.position" = "FL,FR";
      };
      playbackProps = {
        "audio.position" = "FL,FR";
      };
    };
  createDeepFilterNode = {name}:
    createFilterChain {
      inherit name;
      plugin = "${pkgs.deepfilternet}/lib/ladspa/libdeep_filter_ladspa.so";
      label = "deep_filter_mono";
      captureProps = {
        "node.autoconnect" = "false";
        "audio.position" = "MONO";
      };
      playbackProps = {
        "audio.position" = "MONO";
      };
    };
  createRNNoiseNode = {name}:
    createFilterChain {
      inherit name;
      plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
      label = "noise_suppressor_mono";
      control = {
        "VAD Threshold (%)" = 50.0;
        "VAD Grace Peroid (ms)" = 200;
        "Retroactive VAD Grace (ms)" = 0;
      };
      captureProps = {
        "node.autoconnect" = "false";
        "audio.position" = "MONO";
      };
      playbackProps = {
        "audio.position" = "MONO";
      };
    };
  nodes = {
    desktop-audio = "Desktop Audio";
    discord-audio = "Discord Audio";
    game-audio = "Game Audio";
    desktop-compressor = "Desktop Compressor";
    discord-compressor = "Discord Compressor";
    game-compressor = "Game Compressor";
    hd6xx-eq-input = "HD6XX EQ Input";
    hd6xx-eq-output = "HD6XX EQ Output";
    pre-eq = "Pre-EQ";
    dfn = "DeepFilterNet Noise Reduction";
    rnnoise = "RNNoise Cancelling";
  };
in {
  services.pipewire = {
    extraConfig.pipewire = {
      "desktop-audio" = createAudioSink nodes.desktop-audio;
      "discord-audio" = createAudioSink nodes.discord-audio;
      "game-audio" = createAudioSink nodes.game-audio;
      "pre-eq" = createAudioSink nodes.pre-eq;
      "para-eq" = {
        "context.modules" = [
          {
            name = "libpipewire-module-parametric-equalizer";
            args = {
              "equalizer.filepath" = ./hd6xx.eq;
              "equalizer.description" = "HD6XX EQ";
              "audio.channels" = "2";
              "audio.position" = "FL,FR";
              "capture.props" = {
                "node.name" = nodes.hd6xx-eq-input;
                "node.autoconnect" = "false";
                "node.passive" = "true";
                "monitor.passthrough" = "false";
              };
              "playback.props" = {
                "node.name" = nodes.hd6xx-eq-output;
                "node.autoconnect" = "false";
                "node.passive" = "true";
              };
            };
          }
        ];
      };
      "desktop-compressor" = createLoudMaxNode {
        name = nodes.desktop-compressor;
        threshold = -25.0;
      };
      "discord-compressor" = createLoudMaxNode {
        name = nodes.discord-compressor;
        threshold = -28.0;
      };
      "game-compressor" = createLoudMaxNode {
        name = nodes.game-compressor;
        threshold = -15.0;
      };
      "deepfilternet-noisereduction" = createDeepFilterNode {name = nodes.dfn;};
      "rnnoise" = createRNNoiseNode {name = nodes.rnnoise;};
      # Pipewire does not currently load it's configuration in order
      # so the link-factory always errors out, so Wireplumber is needed
      # "40-link-null-sink" = {
      #   "context.objects" = [
      #     {
      #       factory = "link-factory";
      #       args = {
      #         "link.output.node" = nodes.desktop-audio;
      #         "link.output.port" = "monitor_FL";
      #         "link.input.node" = nodes.desktop-compressor;
      #         "link.input.port" = "input_FL";
      #         #"link.passive" = "true";
      #       };
      #     }
      #   ];
      # };
    };
    wireplumber = {
      extraConfig = {
        "99-auto-connect" = {
          "wireplumber.components" = [
            {
              name = "startup/auto-connect-ports.lua";
              type = "script/lua";
              provides = "custom.auto-connect-ports";
            }
          ];
          "wireplumber.profiles" = {
            main = {
              "custom.auto-connect-ports" = "required";
            };
          };
        };
      };
      extraScripts = {
        "startup/auto-connect-ports.lua" = builtins.readFile ./auto-connect-ports.lua;
      };
    };
  };
}
