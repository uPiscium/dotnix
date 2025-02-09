{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    settings = {
      PubkeyAuthentication = "yes";
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.upiscium.openssh.authorizedKeys.keys = [
    "ssh-ed25520 AAAAC3NzaC1lZDI1NTE5AAAAIEIhW/ts3oIwZVt9LtK9M9ksTqTAW0M8oZVIby8+w/z3 upiscium@ROGSTRIX"
  ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
