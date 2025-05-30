{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 53 20000 ];
    allowedUDPPorts = [ 53 30000 ];
  };
}
