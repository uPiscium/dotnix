{ ... }: {
  services.nginx = {
    enable = true;
    virtualHosts."ollama.iruma.arc" = {
      forceSSL = false; # allow HTTP access
      locations."/" = {
        proxyPass = "http://192.168.11.90:3000";
        proxyWebsockets = true; # allow WebSocket
      };
    };
    virtualHosts."gabriel.iruma.arc" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.80:8006";
        proxyWebsockets = true;
      };
    };
    virtualHosts."metatron.iruma.arc" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.82:8006";
        proxyWebsockets = true;
      };
    };
    virtualHosts."raphael.iruma.arc" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.81:8006";
        proxyWebsockets = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
