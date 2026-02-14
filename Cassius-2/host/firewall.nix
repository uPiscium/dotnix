{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 11434 8001 ];
    allowedUDPPorts = [ 11434 ];
  };
}

