{ ... }: {
  services.openssh = {
    ports = [ 20000 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "upiscium" ];
      ChallengeResponseAuthentication = false;
      PubkeyAuthentication = true;
      PermitEmptyPasswords = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
    };
  };

  users.users."upiscium".openssh.authorizedKeys.keyFiles = [
    "../../.ssh/authorized_keys"
  ];
}
