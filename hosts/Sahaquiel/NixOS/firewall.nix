{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 11434 ];
    allowedUDPPorts = [ 11434 ];
  };
}

