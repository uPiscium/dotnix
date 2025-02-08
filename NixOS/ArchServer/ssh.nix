{pkgs, ...}: {
  services.openssh = {
    enable = true;
    ports = [20000];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [20000];
}
