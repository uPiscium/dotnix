{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 21000 22000 ];
    allowedUDPPorts = [ 20000 21000 22000 ];
  };
}
