{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.upiscium.openssh.authorizedKeys.keys = [
    "AAAAC3NzaC1lZDI1NTE5AAAAIJvyVdbmhxTZ4ui5c2ICJHN7RmmCpTjgWW0Zz+Py0dAo"
  ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
