{pkgs, ...}: let
  phl246e9q-edid = pkgs.runCommand "phl246e9q-edid" {} ''
    mkdir -p "$out/lib/firmware/edid"
    cat ${./phl246e9q-noypbpr.edid} > "$out/lib/firmware/edid/phl246e9q.edid"
  '';
in {
  hardware.display = {
    edid.enable = true;
    edid.packages = [phl246e9q-edid];
    outputs."HDMI-A-1".edid = "phl246e9q.edid";
  };
}
