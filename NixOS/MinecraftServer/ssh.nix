{ ... }: {
  services.openssh = {
    ports = [ 22 ];
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

  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 22 ];
}
