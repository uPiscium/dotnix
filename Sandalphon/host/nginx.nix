{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."ollama.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://192.168.11.100:3000";
        proxyWebsockets = true; # allow WebSocket
      };
    };
    virtualHosts."pdf-translator.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://192.168.11.130:3000";
        proxyWebsockets = true; # allow WebSocket
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
    virtualHosts."proxmox-gabriel.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "https://192.168.11.80:8006";
        proxyWebsockets = true;
      };
    };
    virtualHosts."proxmox-metatron.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "https://192.168.11.82:8006";
        proxyWebsockets = true;
      };
    };
    virtualHosts."proxmox-raphael.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "https://192.168.11.81:8006";
        proxyWebsockets = true;
      };
    };
    virtualHosts."proxmox-zadkiel.iruma.arc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "https://192.168.11.83:8006";
        proxyWebsockets = true;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "upisciumnas@gmail.com";
    certs."iruma.arc" = {
      dnsProvider = "cloudflare";
      extraDomains = [
        "ollama.iruma.arc"
        "proxmox.iruma.arc"
      ];
      credentialFiles = {
        cloudflare = "/etc/ssl/cloudflare.ini";
      };
    };
  };
}
