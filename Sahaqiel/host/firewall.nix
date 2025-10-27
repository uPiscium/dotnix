{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8002 ];
    allowedUDPPorts = [ ];
  };
}

