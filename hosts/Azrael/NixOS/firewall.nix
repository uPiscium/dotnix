{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8080 ];
  };
}
