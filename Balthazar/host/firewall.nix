{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 11434 3001 ];
    allowedUDPPorts = [ 11434 ];
  };
}

