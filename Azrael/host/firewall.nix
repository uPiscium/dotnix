{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 11434 3000 8001 ];
    allowedUDPPorts = [ 11434 3000 ];
  };
}

