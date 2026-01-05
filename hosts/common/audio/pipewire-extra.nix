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
                name = "loudmax";
                plugin = loudmax_plugin;
                label = "ldmx_stereo";
                control = {
                  "Threshold (db)" = "-25";
                  "Output (db)" = "0";
                };
              }
            ];
          };
          "capture.props" = {
            "node.name" = "loudmax.capture";
            "node.passive" = "true";
            "node.autoconnect" = "false";
          };
          "playback.props" = {
            "node.name" = "loudmax.playback";
            "media.class" = "Audio/Source";
          };
        };
      }
    ];
  };
in {
  services.pipewire.extraConfig.pipewire = {
    "10-desktop-audio" = createAudioSink "Desktop Audio";
    "10-discord-audio" = createAudioSink "Discord Audio";
    "15-para-eq" = {
      "context.modules" = [
        {
          name = "libpipewire-module-parametric-equalizer";
          args = {
            "equalizer.filepath" = ./hd6xx.eq;
            "equalizer.description" = "HD6XX EQ";
            "audio.channels" = "2";
            "audio.position" = "FL,FR";
            "capture.props" = {
              "node.name" = "hd6xx-eq";
              "node.autoconnect" = "false";
              "node.passive" = "true";
              "monitor.passthrough" = "false";
            };
            "playback.props" = {
              "node.name" = "hd6xx-eq";
              "node.autoconnect" = "false";
              "node.passive" = "true";
            };
          };
        }
      ];
    };
    "20-desktop-compressor" = createLoudMaxNode {
      name = "Desktop Compressor";
      threshold = "-25";
    };
    "20-discord-compressor" = createLoudMaxNode {
      name = "Discord Compressor";
      threshold = "-28";
    };
    # "20-link-null-sink" = {
    #  "context.objects" = [
    #    {
    #      factory = "link-factory";
    #      arg = {
    #        "link.output.node" = "my-sink";
    #        "link.output.port" = "output_FL";
    #        "link.input.node" = "system";
    #        "link.input.port" = "playback_1";
    #        "link.passive" = "true";
    #      };
    #    }
    #  ];
    # };
  };
}
