{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 25565 8443 8123 ];
    allowedTCPPortRanges = [{ from = 30000; to = 31000; }];
  };
}
