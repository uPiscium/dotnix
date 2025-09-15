{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 30000 8000 ];
  };
}
