{ pkgs, ... }: {
  networking.allowedTCPPorts = [ 80 443 33073 10000 ];
  networking.allowedUDPPorts = [ 3478 ];
  networking.allowedUDPRanges = [{ from = 49152; to = 65535; }];

  services.netbird = {
    enable = true;
    server.domain = "uriel.arc";
  };
}
