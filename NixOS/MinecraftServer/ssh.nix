{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 20000 ];
    # settings = {
    #   PasswordAuthentication = true;
    #   AllowUsers = [ "upiscium" ];
    #   UseDns = true;
    #   X11Forwarding = false;
    #   PermitRootLogin = "prohibit-password";
    # };
  };

  # users.users."upiscium".openssh.authorizedKeys.keyFiles = [
  #   ./authorized_keys
  # ];

  networking.firewall.allowedTCPPorts = [ 20000 ];
}
