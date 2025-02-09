{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    settings = {
      PubkeyAuthentication = "yes";
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      authorizedKeys = [
        "AAAAC3NzaC1lZDI1NTE5AAAAIEIhW/ts3oIwZVt9LtK9M9ksTqTAW0M8oZVIby8+w/z3"
      ];
    };
  };

  # users.users.upiscium.openssh.authorizedKeys.keys = [
  #   "AAAAC3NzaC1lZDI1NTE5AAAAIEIhW/ts3oIwZVt9LtK9M9ksTqTAW0M8oZVIby8+w/z3"
  # ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
