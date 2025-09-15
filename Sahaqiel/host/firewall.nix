{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8080 ];
    allowedUDPPorts = [ 8080 ];
  };
}

