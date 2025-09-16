{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8004 8005 11434 ];
    allowedUDPPorts = [ 11434 ];
  };
}

