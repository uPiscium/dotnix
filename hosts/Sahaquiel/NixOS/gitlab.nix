{ ... }: {
  services.gitlab = {
    enable = true;
    externalUrl = "https://sahaquiel.iruma.arc";
    initialRootPasswordFile = "/var/keys/gitlab-root-password";
    smtp = {
      enable = true;
      address = "sahaquiel.iruma.arc";
      port = 587;
      user = "upiscium@gmail.com";
      passwordFile = "/var/keys/gitlab-smtp-password";
      domain = "iruma.arc";
      authentication = "login";
      startTLS = true;
    };
    databasePasswordFile = "/var/keys/gitlab-db-password";
  };

  services.nginx = {
    enable = true;
    virtualHosts."gitlab.example.com" = {
      enableACME = true;
      forceSSL = true;
    };
  };

  security.acme = {
    acceptTerms = true;
    email = "upiscium@gmail.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
