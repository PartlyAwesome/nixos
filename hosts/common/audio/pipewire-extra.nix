{
  services.pipewire.extraConfig.pipewire = {
    "10-null-sink" = {
      "context.objects" = [
        {
          factory = "adapter";
          args = {
            "factory.name" = "support.null-audio-sink";
            "node.name" = "my-sink";
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
    "20-filter-chain" = {
      "context.modules" = [
      ];
    };
    #"20-link-null-sink" = {
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
    #};
  };
}
