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

  # users.users."upiscium".openssh.authorizedKeys.keys = [
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmhk61jAkamnJnwiIOsiYf3EcPrfBn94QrAz8UL9pbs upiscium@ROGSTRIX"
  # ];
}
