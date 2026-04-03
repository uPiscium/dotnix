{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    # allowedTCPPortRanges = [ {
    #   from = 1;
    #   to = 65535;
    # } ];
    # allowedUDPPortRanges = [ {
    #   from = 1;
    #   to = 65535;
    # } ];
  };
}
