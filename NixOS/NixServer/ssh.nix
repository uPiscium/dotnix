{ ... }: {
  users.users.upiscium.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPfOfHIAEsrWG0hdPDB+TPXoDJ6qUffe0Z8xOPgSUV8e upiscium"
  ];
  services.openssh = {
    ports = [ 20000 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "upiscium" ];
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };
  };

  # programs.ssh = {
  #   pubkeyAcceptedKeyTypes = [ "ssh-ed25519" ];
  #   hostKeyAlgorithms = [ "ssh-ed25519" ];
  # };

  networking.firewall.allowedTCPPorts = [ 20000 ];
  networking.firewall.allowedUDPPorts = [ 20000 ];
}

