{ ... }: {
  services.gitlab = {
    enable = true;
    host = "sahaquiel.iruma.arc";
    port = 3000;
    initialRootPasswordFile = "/var/keys/gitlab-root-password";
    databasePasswordFile = "/var/keys/gitlab-db-password";
    # smtp = {
    #   enable = true;
    #   address = "sahaquiel.iruma.arc";
    #   port = 587;
    #   user = "upiscium@gmail.com";
    #   passwordFile = "/var/keys/gitlab-smtp-password";
    #   domain = "iruma.arc";
    #   authentication = "login";
    #   startTLS = true;
    # };
  };
}
