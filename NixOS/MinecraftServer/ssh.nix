{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    passwordAuthentication = true;
    permitRootLogin = "no";
  };

  users.users.upiscium.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILCp49Fwz/03KWdH63I3AFz1vIu9BJyew+NcP4TSoua1 upiscium"
  ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
