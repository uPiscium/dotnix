{...}: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8080 3000 11434];
  };
}
