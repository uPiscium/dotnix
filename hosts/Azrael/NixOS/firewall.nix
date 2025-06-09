{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 11434 3000];
    allowedUDPPorts = [ 11434 3000 ];
  };
}

