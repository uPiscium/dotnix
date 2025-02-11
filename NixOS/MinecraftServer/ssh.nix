{ ... }: {
  services.openssh = {
    ports = [ 40000 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "upiscium" ];
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  users.users."upiscium".openssh.authorizedKeys.keyFiles = [
    ./authorized_keys
  ];

  networking.firewall.allowedTCPPorts = [ 40000 ];
}
