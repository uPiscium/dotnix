{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 80 443 20000 ];
  };
}
