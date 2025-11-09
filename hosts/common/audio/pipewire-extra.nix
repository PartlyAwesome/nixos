{
  config,
  ...
}:

{
  services.pipewire.extraConfig.pipewire."10-null-sink" = {
    "context.objects" = [
      {
        factory = "adapter";
        args = {
          "factory.name" = "support.null-audio-sink";
          "node.name" = "my-sink";
          "media.class" = "Audio/Sink";
          "audio.position" = "FL,FR";
          "monitor.channel-values" = "true";
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
}
