{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 8000 ];
    allowedUDPPorts = [ 8000 ];
  };
}
