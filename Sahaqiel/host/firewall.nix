{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8004 8002 ];
    allowedUDPPorts = [ ];
  };
}

