{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 25565 ];
    allowedTCPPortRanges = [ { from = 30000; to = 31000; } ];
  };
}
