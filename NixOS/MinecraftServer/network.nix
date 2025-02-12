{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 21000 ];
  };
}
