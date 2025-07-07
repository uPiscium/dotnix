{ ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 8000 ];
  };
}
