{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    settings = {
      #PubkeyAuthentication = "yes";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users."upiscium".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmhk61jAkamnJnwiIOsiYf3EcPrfBn94QrAz8UL9pbs upiscium@ROGSTRIX"
  ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
