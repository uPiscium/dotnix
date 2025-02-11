{ ... }: {
  services.openssh = {
    ports = [ 20000 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "upiscium" ];
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  users.users."upiscium".openssh.authorizedKeys.keyFiles = [
    ../ROGSTRIX.pub
  ];

  networking.firewall = {
    allowedTCPPorts = [ 20000 ];
  };
}
