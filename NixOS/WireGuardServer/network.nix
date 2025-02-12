{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 ];
    allowedUDPPorts = [ 30000 ];
  };
}
