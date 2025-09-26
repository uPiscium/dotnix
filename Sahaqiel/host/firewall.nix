{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8002 8003 ];
    allowedUDPPorts = [ ];
  };
}

