{ pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [ 80 443 33073 10000 ];
  networking.firewall.allowedUDPPorts = [ 3478 ];
  networking.firewall.allowedUDPPortRanges = [{ from = 49152; to = 65535; }];

  services.netbird = {
    enable = true;
    server.domain = "uriel.arc";
  };
}
