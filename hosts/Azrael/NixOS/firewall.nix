{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 443 20000 ];
  };
}
