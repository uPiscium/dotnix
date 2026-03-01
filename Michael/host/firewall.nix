{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 10000 ];
    allowedUDPPorts = [ ];
  };
}
