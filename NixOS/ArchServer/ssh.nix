{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users."upiscium".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJvyVdbmhxTZ4ui5c2ICJHN7RmmCpTjgWW0Zz+Py0dAo upiscium@ROGSTRIX"
  ];

  networking.interfaces.enp5s0.ipv4.addresses = [ {
    address = "192.168.11.130";
    prefixLength = 24;
  } ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
