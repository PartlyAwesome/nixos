{pkgs, ...}: let
  loudmax_plugin = pkgs.runCommand "loudmax64.so" {
    nativeBuildInputs = [pkgs.autoPatchelfHook];
    buildInputs = [pkgs.stdenv.cc.cc pkgs.stdenv.cc.libc];
  } "cp ${./loudmax/loudmax64.so} $out && chmod +w $out && autoPatchelf $out";
  createAudioSink = name: {
    "context.objects" = [
      {
        factory = "adapter";
        args = {
          "factory.name" = "support.null-audio-sink";
          "node.name" = name;
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
  createLoudMaxNode = {
    name,
    threshold,
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
                name = name;
                plugin = loudmax_plugin;
                label = "ldmx_stereo";
                control = {
                  "Threshold (dB)" = threshold;
                  "Output (dB)" = 0;
                };
              }
            ];
          };
          "capture.props" = {
            "node.name" = name;
            "node.passive" = "true";
            "node.autoconnect" = "false";
          };
          "playback.props" = {
            "node.name" = name;
            "media.class" = "Audio/Source";
          };
        };
      }
    ];
  };
  nodes = {
    desktop-audio = "Desktop Audio";
    discord-audio = "Discord Audio";
    desktop-compressor = "Desktop Compressor";
    discord-compressor = "Discord Compressor";
    hd6xx-eq-input = "HD6XX EQ Input";
    hd6xx-eq-output = "HD6XX EQ Output";
  };
in {
  services.pipewire.extraConfig.pipewire = {
    "10-desktop-audio" = createAudioSink nodes.desktop-audio;
    "15-discord-audio" = createAudioSink nodes.discord-audio;
    "20-para-eq" = {
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
    "25-desktop-compressor" = createLoudMaxNode {
      name = nodes.desktop-compressor;
      threshold = -25.0;
    };
    "30-discord-compressor" = createLoudMaxNode {
      name = nodes.discord-compressor;
      threshold = -28.0;
    };
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
}
