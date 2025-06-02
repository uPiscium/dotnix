{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 3000 11434 ];
  };
}
