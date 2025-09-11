{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."ollama.iruma.arc" = {
      forceSSL = true;
      sslCertificate = "/etc/ssl/proxy.crt";
      sslCertificateKey = "/etc/ssl/proxy.key";
      locations."/" = {
        proxyPass = "https://192.168.11.100:3000";
        proxyWebsockets = true; # allow WebSocket
      };
    };

    virtualHosts."nas.iruma.arc" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.128:3670";
      };
    };

    virtualHosts."proxmox.iruma.arc" = {
      forceSSL = true;
      sslCertificate = "/etc/ssl/proxy.crt";
      sslCertificateKey = "/etc/ssl/proxy.key";
      locations."/" = {
        proxyPass = "https://192.168.11.82:8006";
        proxyWebsockets = true;
      };
    };
  };

  # security.acme = {
  #   acceptTerms = true;
  #   defaults.email = "upisciumnas@gmail.com";
  #   certs."upiscium.f5.si" = {
  #     dnsProvider = "cloudflare";
  #     credentialsFile = "/etc/ssl/credential";
  #   };
  # };
}
